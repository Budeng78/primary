import React, { useState, useEffect } from 'react';
import axios from 'axios';

// Komponen utama untuk fungsionalitas login OTP
const OtpLogin = () => {
    // State untuk mengelola input dan status
    const [name, setName] = useState('');
    const [whatsappNumber, setWhatsappNumber] = useState('');
    const [otpCode, setOtpCode] = useState('');
    const [isOtpSent, setIsOtpSent] = useState(false);
    const [message, setMessage] = useState('');
    const [isLoggedIn, setIsLoggedIn] = useState(false);

    // Fungsi untuk memeriksa dan memperbarui status login dari localStorage
    const checkLoginStatus = () => {
        const storedUser = localStorage.getItem('user');
        const storedToken = localStorage.getItem('token');
        // Periksa keberadaan user DAN token
        if (storedUser && storedToken) {
            setIsLoggedIn(true);
            setMessage('Anda sudah login.');
            return true;
        } else {
            setIsLoggedIn(false);
            return false;
        }
    };

    // Efek untuk memeriksa status login saat komponen dimuat
    useEffect(() => {
        checkLoginStatus();
    }, []);

    /**
     * Menangani pengiriman OTP ke backend.
     * Menggunakan axios untuk mengirim POST request ke endpoint /api/otp/send
     */
    const handleSendOtp = async (e) => {
        e.preventDefault();
        setMessage(''); // Bersihkan pesan sebelumnya
        
        // Cek kembali status login sebelum mengirim OTP
        if (checkLoginStatus()) {
            setMessage('Anda sudah login. Tidak perlu mengirim OTP.');
            return;
        }

        try {
            // Mengirim nama dan nomor WA ke server
            const response = await axios.post('/api/otp/send', {
                name,
                whatsapp_number: whatsappNumber,
            });
            
            // Set pesan sukses dan ubah state untuk menampilkan input OTP
            setMessage(response.data.message);
            setIsOtpSent(true);
        } catch (error) {
            // Tangani error, tampilkan pesan dari server jika ada
            const errorMessage = error.response?.data?.message || 'Terjadi kesalahan saat mengirim OTP.';
            setMessage(errorMessage);
        }
    };

    /**
     * Menangani verifikasi OTP.
     * Menggunakan axios untuk mengirim POST request ke endpoint /api/otp/verify
     */
    const handleVerifyOtp = async (e) => {
        e.preventDefault();
        setMessage(''); // Bersihkan pesan sebelumnya

        try {
            // Mengirim nomor WA dan kode OTP ke server
            const response = await axios.post('/api/otp/verify', {
                whatsapp_number: whatsappNumber,
                otp_code: otpCode,
            });

            // Set pesan sukses dari server
            setMessage(response.data.message);
            console.log('Verifikasi berhasil!', response.data);
            
            // SIMPAN DATA PENGGUNA DAN TOKEN KE localStorage
            localStorage.setItem('user', JSON.stringify(response.data.user));
            // Tambahkan baris ini untuk menyimpan token placeholder
            localStorage.setItem('token', 'authenticated');
            
            // --- MODIFIKASI DIMULAI DI SINI ---
            // Setelah berhasil, arahkan pengguna ke halaman beranda/dashboard
            // Anda bisa mengubah URL '/dashboard' dengan URL yang Anda inginkan
            // Contoh lain: '/home' atau '/app'
            window.location.href = '/';
            // --- MODIFIKASI BERAKHIR DI SINI ---

        } catch (error) {
            // Tangani error, tampilkan pesan dari server jika ada
            const errorMessage = error.response?.data?.message || 'Kode OTP salah atau kedaluwarsa.';
            setMessage(errorMessage);
        }
    };

    const handleLogout = () => {
        localStorage.removeItem('user');
        // Hapus juga token saat logout
        localStorage.removeItem('token');
        // Perbarui status login setelah logout
        checkLoginStatus();
        setIsOtpSent(false);
        setMessage('Anda telah logout.');
        setName('');
        setWhatsappNumber('');
        setOtpCode('');
    };

    // Tampilan jika sudah login.
    // Catatan: Karena ada redirect, bagian ini mungkin tidak akan terlihat
    // jika pengguna login dari halaman ini. Namun, ini akan berguna jika
    // pengguna sudah login saat pertama kali memuat aplikasi.
    if (isLoggedIn) {
        return (
            <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100">
                <div className="bg-white p-8 rounded-lg shadow-md w-96 text-center">
                    <h1 className="text-2xl font-bold text-green-600 mb-4">Anda Sudah Login!</h1>
                    <p className="text-gray-600 mb-6">Selamat datang kembali.</p>
                    <button
                        onClick={handleLogout}
                        className="w-full py-2 px-4 bg-red-600 text-white font-bold rounded-md hover:bg-red-700 transition duration-300"
                    >
                        Logout
                    </button>
                </div>
            </div>
        );
    }

    return (
        <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100">
            <div className="bg-white p-8 rounded-lg shadow-md w-96">
                <h1 className="text-2xl font-bold text-center mb-6">Login dengan OTP</h1>
                <form onSubmit={isOtpSent ? handleVerifyOtp : handleSendOtp}>
                    {/* Input Nama, tetap ditampilkan tetapi dinonaktifkan jika OTP sudah dikirim */}
                    <div className="mb-4">
                        <label htmlFor="name" className="block text-gray-700 font-semibold mb-2">Nama</label>
                        <input
                            type="text"
                            id="name"
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            placeholder="Masukkan nama Anda"
                            required
                            disabled={isOtpSent} // Input dinonaktifkan setelah OTP dikirim
                            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>
                    
                    {/* Input Nomor WhatsApp */}
                    <div className="mb-4">
                        <label htmlFor="whatsapp" className="block text-gray-700 font-semibold mb-2">Nomor WhatsApp</label>
                        <input
                            type="tel"
                            id="whatsapp"
                            value={whatsappNumber}
                            onChange={(e) => setWhatsappNumber(e.target.value)}
                            placeholder="cth: 081234567890"
                            required
                            // Nonaktifkan input setelah OTP dikirim
                            disabled={isOtpSent}
                            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Tampilkan tombol "Kirim OTP" atau input "Kode OTP" */}
                    {!isOtpSent ? (
                        <button
                            type="submit"
                            className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
                        >
                            Kirim OTP
                        </button>
                    ) : (
                        <>
                            <div className="mb-4">
                                <label htmlFor="otp" className="block text-gray-700 font-semibold mb-2">Kode OTP</label>
                                <input
                                    type="text"
                                    id="otp"
                                    value={otpCode}
                                    onChange={(e) => setOtpCode(e.target.value)}
                                    placeholder="Masukkan 6 digit kode OTP"
                                    maxLength="6"
                                    required
                                    className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
                                />
                            </div>
                            
                            <button
                                type="submit"
                                className="w-full py-2 px-4 bg-green-600 text-white font-bold rounded-md hover:bg-green-700 transition duration-300"
                            >
                                Verifikasi
                            </button>
                        </>
                    )}
                </form>

                {/* Tampilkan pesan dari server */}
                {message && (
                    <p className={`mt-4 text-center text-sm font-semibold ${message.includes('berhasil') ? 'text-green-600' : 'text-red-600'}`}>
                        {message}
                    </p>
                )}
            </div>
        </div>
    );
};

// Pastikan untuk mengekspor komponen utama sebagai default
export default OtpLogin;
