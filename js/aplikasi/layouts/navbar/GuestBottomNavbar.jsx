import React, { useState } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom'; // 1. Import useNavigate
import { FaHome, FaSignInAlt } from 'react-icons/fa';
import LoginOptionsModal from '@/aplikasi/components/modal/LoginOptionsModal';

const GuestBottomNavbar = () => {
    const location = useLocation();
    const navigate = useNavigate(); // 2. Inisialisasi useNavigate
    const [showModal, setShowModal] = useState(false);

    // 3. Tambahkan fungsi untuk menangani navigasi
    const handleLogin = () => {
        setShowModal(false); // Tutup modal
        navigate('/auth/login'); // Arahkan ke halaman login
    };

    const handleRegister = () => {
        setShowModal(false); // Tutup modal
        navigate('/auth/register'); // Arahkan ke halaman register
    };

    return (
        <>
            <nav className="fixed bottom-0 left-0 right-0 bg-white border-t shadow-md z-50 md:hidden">
                <ul className="flex justify-around items-center py-2">
                    <li>
                        <Link
                            to="/"
                            className={`flex flex-col items-center text-xs ${
                                location.pathname === '/' ? 'text-blue-600 font-semibold' : 'text-gray-500'
                            }`}
                        >
                            <div className="text-xl mb-1"><FaHome /></div>
                            Beranda
                        </Link>
                    </li>
                    <li>
                        <button
                            onClick={() => setShowModal(true)}
                            className="flex flex-col items-center text-xs text-gray-500 hover:text-blue-600"
                        >
                            <div className="text-xl mb-1"><FaSignInAlt /></div>
                            Login
                        </button>
                    </li>
                </ul>
            </nav>

            {/* 4. Meneruskan fungsi handleLogin dan handleRegister sebagai props ke modal */}
            <LoginOptionsModal
                isOpen={showModal}
                onClose={() => setShowModal(false)}
                onLogin={handleLogin}
                onRegister={handleRegister}
            />
        </>
    );
};

export default GuestBottomNavbar;