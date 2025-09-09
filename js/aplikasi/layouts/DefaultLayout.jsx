// resources/js/aplikasi/layouts/DefaultLayout.jsx

import React, { useContext, useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import AuthContext from '@/aplikasi/auth/AuthContext';
import TopNavBar from '@/aplikasi/layouts/navbar/TopNavBar';
import BottomNavbar from '@/aplikasi/layouts/navbar/BottomNavbar';
import SideNavbar from '@/aplikasi/layouts/navbar/SideNavbar';
import LoginOptionsModal from '@/aplikasi/components/modal/LoginOptionsModal';
import ShowWelcomeModal from '@/aplikasi/components/modal/showWelcomeModal';
import { 
    authDesktopMenuItems, 
    authMobileMenuItems, 
    guestDesktopMenuItems, 
    guestMobileMenuItems 
} from '@/aplikasi/layouts/menuConfig';

const DefaultLayout = ({ children }) => {
    const { isAuthenticated, logout, showWelcomeModal, setShowWelcomeModal } = useContext(AuthContext);
    const navigate = useNavigate();
    const [showLoginModal, setShowLoginModal] = useState(false);

    const handleLogin = () => {
        setShowLoginModal(false);
        navigate('/auth/login');
    };

    const handleRegister = () => {
        setShowLoginModal(false);
        navigate('/auth/register');
    };

    // Tambahkan fungsi ini untuk menangani navigasi ke halaman OTP
    const handleOtp = () => {
        setShowLoginModal(false);
        navigate('/auth/otp-login');
    };

    // Pastikan Anda juga memperbarui menuConfig untuk meneruskan fungsi ini.
    // Tambahkan onOtp ke guestDesktopMenuItems dan guestMobileMenuItems di file menuConfig.js
    const desktopMenuItems = isAuthenticated 
        ? authDesktopMenuItems(logout)
        : guestDesktopMenuItems(handleLogin, handleRegister, () => setShowLoginModal(true), handleOtp);

    const mobileMenuItems = isAuthenticated 
        ? authMobileMenuItems(logout)
        : guestMobileMenuItems(handleLogin, handleRegister, () => setShowLoginModal(true), handleOtp);

    return (
        <div className="flex flex-col min-h-screen">
            <TopNavBar />

            <div className="flex flex-1">
                <SideNavbar menuItems={desktopMenuItems} />
                
                <main className="flex-1 p-4 md:ml-38 mt-10">
                    {children}
                </main>
            </div>

            <BottomNavbar menuItems={mobileMenuItems} />

            <LoginOptionsModal
                isOpen={showLoginModal}
                onClose={() => setShowLoginModal(false)}
                onLogin={handleLogin}
                onRegister={handleRegister}
                onOtp={handleOtp} // Teruskan handler ke modal
            />

            {/* Modal Pop-up Selamat Datang */}
            <ShowWelcomeModal
                isOpen={showWelcomeModal}
                onClose={() => setShowWelcomeModal(false)}
            />
        </div>
    );
};

export default DefaultLayout;