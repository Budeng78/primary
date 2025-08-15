// resources/js/components/TopNavBar.jsx
import React from 'react';
import YourLogo from '../../assets/img/logo_mc-wartono.png'; // Pastikan path ini sudah benar

function TopNavBar() {
    return (
        <header className="fixed w-full p-4 bg-blue-900 text-white flex justify-between items-center">
            {/* Menggunakan div untuk mengelompokkan logo dan teks */}
            <div className="flex items-end"> {/* <-- Ubah dari items-center menjadi items-end */}
                <img src={YourLogo} alt="Logo Aplikasi Anda" className="h-10 hover:scale-110 transition duration-300" />
                {/* Tambahkan tulisan kecil di sini */}
                <span className="ml-3 text-xl font-semibold">PT. SUKUN WARTONO INDONESIA</span>
            </div>
            {/* Anda bisa menambahkan elemen lain di sini jika diperlukan, misal tombol menu, dll. */}
        </header>
    );
}

export default TopNavBar;