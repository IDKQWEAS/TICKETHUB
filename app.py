# Impor library yang diperlukan
import os
from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime, timedelta
import random
import string

# Inisialisasi aplikasi Flask
app = Flask(__name__)

# --- KONFIGURASI UNTUK MYSQL ---
app.config['SECRET_KEY'] = 'kunci-rahasia-yang-sangat-sulit-ditebak'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/tickethub_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Inisialisasi database
db = SQLAlchemy(app)

# --- Daftar Stasiun KRL Yogyakarta-Solo ---
STASIUN_KRL_YOGYA_SOLO = [
    "Palur", "Solo Jebres", "Solo Balapan", "Purwosari", "Gawok", 
    "Delanggu", "Ceper", "Klaten", "Srowot", "Brambanan", 
    "Maguwo", "Lempuyangan", "Yogyakarta"
]

# --- MODEL DATABASE ---

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    nama_lengkap = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(256), nullable=False)
    pesanan = db.relationship('Pesanan', backref='pemesan', lazy=True)

class Jadwal(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    tipe_kereta = db.Column(db.String(50), nullable=False)
    nama_kereta = db.Column(db.String(100), nullable=False)
    kelas = db.Column(db.String(50), nullable=True)
    stasiun_asal = db.Column(db.String(100), nullable=False)
    stasiun_tujuan = db.Column(db.String(100), nullable=False)
    waktu_berangkat = db.Column(db.DateTime, nullable=False)
    waktu_tiba = db.Column(db.DateTime, nullable=True)
    harga = db.Column(db.Integer, nullable=True)
    sisa_kursi = db.Column(db.Integer, nullable=True)

class Pesanan(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    kode_booking = db.Column(db.String(20), unique=True, nullable=False)
    id_user = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    id_jadwal = db.Column(db.Integer, db.ForeignKey('jadwal.id'), nullable=False)
    jumlah_tiket = db.Column(db.Integer, nullable=False)
    total_harga = db.Column(db.Integer, nullable=False)
    tanggal_pesan = db.Column(db.DateTime, default=datetime.utcnow)
    status = db.Column(db.String(50), default='Menunggu Pembayaran')
    metode_pembayaran = db.Column(db.String(50), nullable=True)
    jadwal = db.relationship('Jadwal', backref='pesanan', lazy=True)

# --- RUTE APLIKASI ---

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/kereta-jarak-jauh')
def kereta_jarak_jauh():
    stasiun_asal_list = db.session.query(Jadwal.stasiun_asal).filter_by(tipe_kereta='Jarak Jauh').distinct().all()
    stasiun_tujuan_list = db.session.query(Jadwal.stasiun_tujuan).filter_by(tipe_kereta='Jarak Jauh').distinct().all()
    return render_template('kereta_jarak_jauh.html', stasiun_asal_list=stasiun_asal_list, stasiun_tujuan_list=stasiun_tujuan_list)

@app.route('/commuter')
def commuter():
    return render_template('commuter.html', stasiun_list=STASIUN_KRL_YOGYA_SOLO)

# --- PERUBAHAN DI API ENDPOINT ---
@app.route('/api/commuter/jadwal/<stasiun_awal>')
def api_jadwal_commuter(stasiun_awal):
    jadwal_berangkat = Jadwal.query.filter_by(
        tipe_kereta='Commuter',
        stasiun_asal=stasiun_awal
    ).order_by(Jadwal.waktu_berangkat).all()
    
    # Gabungkan semua jadwal ke dalam satu list
    semua_jadwal = []
    for jadwal in jadwal_berangkat:
        semua_jadwal.append({
            'waktu_berangkat': jadwal.waktu_berangkat.strftime('%H:%M'),
            'tujuan_akhir': jadwal.stasiun_tujuan,
            'nama_kereta': jadwal.nama_kereta 
        })
        
    # API sekarang mengembalikan satu list yang sudah terurut
    return jsonify(semua_jadwal)

@app.route('/cari', methods=['POST'])
def cari_tiket():
    stasiun_asal = request.form['stasiun_asal']
    stasiun_tujuan = request.form['stasiun_tujuan']
    tanggal_berangkat_str = request.form['tanggal_berangkat']
    jumlah_penumpang = int(request.form['jumlah_penumpang'])
    session['jumlah_penumpang'] = jumlah_penumpang
    tanggal_berangkat = datetime.strptime(tanggal_berangkat_str, '%Y-%m-%d').date()
    hasil_pencarian = Jadwal.query.filter(
        Jadwal.tipe_kereta == 'Jarak Jauh',
        Jadwal.stasiun_asal == stasiun_asal,
        Jadwal.stasiun_tujuan == stasiun_tujuan,
        db.func.date(Jadwal.waktu_berangkat) == tanggal_berangkat,
        Jadwal.sisa_kursi >= jumlah_penumpang
    ).all()
    return render_template('hasil.html', hasil=hasil_pencarian, tanggal=tanggal_berangkat_str)

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        nama_lengkap = request.form['nama_lengkap']
        email = request.form['email']
        password = request.form['password']
        if User.query.filter_by(username=username).first() or User.query.filter_by(email=email).first():
            flash('Username atau Email sudah terdaftar!', 'danger')
            return redirect(url_for('register'))
        password_hash = generate_password_hash(password)
        user_baru = User(username=username, nama_lengkap=nama_lengkap, email=email, password_hash=password_hash)
        db.session.add(user_baru)
        db.session.commit()
        flash('Registrasi berhasil! Silakan login.', 'success')
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = User.query.filter_by(username=username).first()
        if user and check_password_hash(user.password_hash, password):
            session['user_id'] = user.id
            session['username'] = user.username
            flash('Login berhasil!', 'success')
            return redirect(url_for('index'))
        else:
            flash('Login gagal. Cek kembali username dan password Anda.', 'danger')
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    flash('Anda telah berhasil logout.', 'info')
    return redirect(url_for('index'))

@app.route('/pesan/<int:id_jadwal>')
def pesan(id_jadwal):
    if 'user_id' not in session:
        flash('Anda harus login terlebih dahulu untuk memesan tiket.', 'warning')
        return redirect(url_for('login'))
    jadwal = Jadwal.query.get_or_404(id_jadwal)
    jumlah_penumpang = session.get('jumlah_penumpang', 1)
    if jadwal.sisa_kursi < jumlah_penumpang:
        flash('Maaf, kursi tidak cukup untuk jumlah penumpang yang Anda inginkan.', 'danger')
        return redirect(url_for('kereta_jarak_jauh'))
    total_harga = jadwal.harga * jumlah_penumpang
    return render_template('konfirmasi.html', jadwal=jadwal, jumlah=jumlah_penumpang, total=total_harga)

@app.route('/proses_pembayaran/<int:id_jadwal>', methods=['POST'])
def proses_pembayaran(id_jadwal):
    if 'user_id' not in session:
        flash('Anda harus login untuk melanjutkan.', 'warning')
        return redirect(url_for('login'))
    id_user = session['user_id']
    user = db.session.get(User, id_user)
    if not user:
        session.clear()
        flash('Sesi Anda tidak valid. Silakan login kembali.', 'danger')
        return redirect(url_for('login'))
    jumlah_tiket = session.get('jumlah_penumpang', 1)
    metode = request.form.get('metode_pembayaran')
    jadwal = Jadwal.query.get_or_404(id_jadwal)
    if jadwal.sisa_kursi < jumlah_tiket:
        flash('Maaf, kursi sudah habis saat Anda memproses pembayaran.', 'danger')
        return redirect(url_for('kereta_jarak_jauh'))
    total_harga = jadwal.harga * jumlah_tiket
    kode_booking = generate_booking_code()
    pesanan_baru = Pesanan(
        kode_booking=kode_booking,
        id_user=id_user,
        id_jadwal=id_jadwal,
        jumlah_tiket=jumlah_tiket,
        total_harga=total_harga,
        metode_pembayaran=metode,
        status='Menunggu Pembayaran'
    )
    jadwal.sisa_kursi -= jumlah_tiket
    db.session.add(pesanan_baru)
    db.session.commit()
    flash(f'Pesanan berhasil dibuat! Segera lakukan pembayaran. Kode Booking Anda: {kode_booking}', 'success')
    return redirect(url_for('riwayat_pesanan'))

@app.route('/riwayat')
def riwayat_pesanan():
    if 'user_id' not in session:
        flash('Anda harus login untuk melihat riwayat pesanan.', 'warning')
        return redirect(url_for('login'))
    id_user = session['user_id']
    semua_pesanan = Pesanan.query.filter_by(id_user=id_user).order_by(Pesanan.tanggal_pesan.desc()).all()
    return render_template('pesanan.html', pesanan_list=semua_pesanan)

def generate_booking_code():
    return 'TH-' + ''.join(random.choices(string.ascii_uppercase + string.digits, k=8))

def setup_database(app):
    with app.app_context():
        db.create_all()
        if Jadwal.query.count() == 0:
            jadwal_jarak_jauh = [
                Jadwal(tipe_kereta='Jarak Jauh', nama_kereta='Argo Bromo', kelas='Eksekutif', stasiun_asal='Gambir (GMR)', stasiun_tujuan='Surabaya Pasarturi (SBI)', waktu_berangkat=datetime(2025, 8, 10, 8, 0), waktu_tiba=datetime(2025, 8, 10, 17, 30), harga=650000, sisa_kursi=50),
                Jadwal(tipe_kereta='Jarak Jauh', nama_kereta='Taksaka', kelas='Eksekutif', stasiun_asal='Gambir (GMR)', stasiun_tujuan='Yogyakarta (YK)', waktu_berangkat=datetime(2025, 8, 11, 20, 45), waktu_tiba=datetime(2025, 8, 12, 4, 15), harga=450000, sisa_kursi=30),
                Jadwal(tipe_kereta='Jarak Jauh', nama_kereta='Argo Lawu', kelas='Eksekutif', stasiun_asal='Gambir (GMR)', stasiun_tujuan='Solo Balapan (SLO)', waktu_berangkat=datetime(2025, 8, 12, 20, 0), waktu_tiba=datetime(2025, 8, 13, 4, 30), harga=550000, sisa_kursi=40),
                Jadwal(tipe_kereta='Jarak Jauh', nama_kereta='Argo Wilis', kelas='Eksekutif', stasiun_asal='Bandung (BD)', stasiun_tujuan='Surabaya Gubeng (SGU)', waktu_berangkat=datetime(2025, 8, 12, 7, 0), waktu_tiba=datetime(2025, 8, 12, 19, 0), harga=600000, sisa_kursi=35),
                Jadwal(tipe_kereta='Jarak Jauh', nama_kereta='Gajayana', kelas='Eksekutif', stasiun_asal='Gambir (GMR)', stasiun_tujuan='Malang (ML)', waktu_berangkat=datetime(2025, 8, 13, 18, 40), waktu_tiba=datetime(2025, 8, 14, 8, 20), harga=700000, sisa_kursi=25),
                Jadwal(tipe_kereta='Jarak Jauh', nama_kereta='Lodaya Pagi', kelas='Bisnis', stasiun_asal='Bandung (BD)', stasiun_tujuan='Solo Balapan (SLO)', waktu_berangkat=datetime(2025, 8, 13, 7, 20), waktu_tiba=datetime(2025, 8, 13, 16, 0), harga=350000, sisa_kursi=60),
                Jadwal(tipe_kereta='Jarak Jauh', nama_kereta='Sancaka', kelas='Ekonomi', stasiun_asal='Yogyakarta (YK)', stasiun_tujuan='Surabaya Gubeng (SGU)', waktu_berangkat=datetime(2025, 8, 14, 17, 10), waktu_tiba=datetime(2025, 8, 14, 21, 45), harga=220000, sisa_kursi=80)
            ]
            db.session.add_all(jadwal_jarak_jauh)
            
            def create_krl_trip(start_time, ka_number, direction='yogya'):
                trip_time = start_time
                if direction == 'yogya':
                    stations = STASIUN_KRL_YOGYA_SOLO
                    tujuan_akhir = "Yogyakarta"
                else:
                    stations = list(reversed(STASIUN_KRL_YOGYA_SOLO))
                    tujuan_akhir = "Palur"
                for i in range(len(stations) - 1):
                    asal = stations[i]
                    waktu_berangkat = datetime.now().replace(hour=trip_time.hour, minute=trip_time.minute, second=0, microsecond=0)
                    nama_ka = f"KRL Commuter Line (KA {ka_number})"
                    jadwal = Jadwal(tipe_kereta='Commuter', nama_kereta=nama_ka, stasiun_asal=asal, stasiun_tujuan=tujuan_akhir, waktu_berangkat=waktu_berangkat)
                    db.session.add(jadwal)
                    trip_time += timedelta(minutes=random.randint(7, 12))
            
            ka_yogya_counter = 601
            ka_palur_counter = 702
            for jam in range(6, 22):
                menit_ganjil = random.randint(0, 29) * 2 + 1 
                create_krl_trip(datetime(2025, 7, 25, jam, menit_ganjil), ka_yogya_counter, direction='yogya')
                ka_yogya_counter += 2
                
                menit_genap = random.randint(0, 29) * 2
                create_krl_trip(datetime(2025, 7, 25, jam, menit_genap), ka_palur_counter, direction='palur')
                ka_palur_counter += 2
            
            db.session.commit()
            print("Database telah dibuat dan diisi dengan data Jarak Jauh & jadwal KRL yang diperbanyak.")

if __name__ == '__main__':
    setup_database(app)
    app.run(debug=True, port=5001)
