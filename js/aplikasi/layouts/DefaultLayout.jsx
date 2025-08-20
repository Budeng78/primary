// resources/js/aplikasi/layouts/DefaultLayout.jsx

import React, { useContext, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import AuthContext from '@/aplikasi/auth/AuthContext';
import TopNavBar from '@/aplikasi/layouts/navbar/TopNavBar';
import BottomNavbar from '@/aplikasi/layouts/navbar/BottomNavbar';
import SideNavbar from '@/aplikasi/layouts/navbar/SideNavbar';
import LoginOptionsModal from '@/aplikasi/components/modal/LoginOptionsModal';
// Pastikan hanya mengimpor satu set komponen navbar
// Hapus import AuthBottomNavbar, GuestBottomNavbar, dll.
import { authMenuItems, guestMenuItems } from '@/aplikasi/layouts/menuConfig';

const DefaultLayout = ({ children }) => {
    const { isAuthenticated } = useContext(AuthContext);
    const navigate = useNavigate();
    
    // State untuk mengontrol modal login
    const [showLoginModal, setShowLoginModal] = useState(false);

    // Fungsi untuk mengarahkan ke login dan register, menutup modal
    const handleLogin = () => {
        setShowLoginModal(false);
        navigate('/auth/login');
    };

    const handleRegister = () => {
        setShowLoginModal(false);
        navigate('/auth/register');
    };

    // Tentukan menu berdasarkan status otentikasi
    // Gunakan fungsi untuk membuat menu tamu
    const currentMenuItems = isAuthenticated 
        ? authMenuItems
        : guestMenuItems(handleLogin, handleRegister, () => setShowLoginModal(true));

    return (
        <div className="flex flex-col min-h-screen">
            <TopNavBar />

            <div className="flex flex-1">
                <SideNavbar menuItems={currentMenuItems} />
                
                <main className="flex-1 p-4 md:ml-38 mt-10">
                    {children}
                </main>
            </div>

            <BottomNavbar menuItems={currentMenuItems} />

            <LoginOptionsModal
                isOpen={showLoginModal}
                onClose={() => setShowLoginModal(false)}
                onLogin={handleLogin}
                onRegister={handleRegister}
            />
        </div>
    );
};

export default DefaultLayout;
