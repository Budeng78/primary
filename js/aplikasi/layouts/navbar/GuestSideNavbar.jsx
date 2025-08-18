// resources/js/aplikasi/layouts/navbar/GuestSideNavbar.jsx

import React, { useState } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { FaHome, FaSignInAlt } from 'react-icons/fa';
import LoginOptionsModal from '@/aplikasi/components/modal/LoginOptionsModal';

const GuestSideNavbar = () => {
    const location = useLocation();
    const navigate = useNavigate();
    const [showModal, setShowModal] = useState(false);

    const handleLogin = () => {
        setShowModal(false);
        navigate('/auth/login');
    };

    const handleRegister = () => {
        setShowModal(false);
        navigate('/auth/register');
    };

    return (
        <>
            {/* Navigasi Samping: disembunyikan di mobile, muncul di desktop */}
            {/* Ganti 'top-0' dengan 'top-16' atau sesuai tinggi TopNavBar Anda */}
            <nav className="hidden md:block fixed top-18 left-0 w-38 h-full bg-white shadow-xl z-40 p-4">
                <div className="flex flex-col h-full justify-between">
                    {/* Hapus 'mt-20' karena posisi sudah diatur oleh 'top-16' */}
                    <ul className="space-y-2"> 
                        <li>
                            <Link
                                to="/"
                                className={`flex items-center space-x-3 p-2 rounded-lg transition-colors duration-200 ${
                                    location.pathname === '/' ? 'bg-blue-100 text-blue-600 font-semibold' : 'text-gray-500 hover:bg-gray-100'
                                }`}
                            >
                                <FaHome className="text-xl" />
                                <span>Beranda</span>
                            </Link>
                        </li>
                        <li>
                            <button
                                onClick={() => setShowModal(true)}
                                className="w-full text-left flex items-center space-x-3 p-2 rounded-lg transition-colors duration-200 text-gray-500 hover:bg-gray-100"
                            >
                                <FaSignInAlt className="text-xl" />
                                <span>Login</span>
                            </button>
                        </li>
                    </ul>
                </div>
            </nav>

            <LoginOptionsModal
                isOpen={showModal}
                onClose={() => setShowModal(false)}
                onLogin={handleLogin}
                onRegister={handleRegister}
            />
        </>
    );
};

export default GuestSideNavbar;