// resources/js/aplikasi/layouts/DefaultLayout.jsx

import React, { useContext, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import AuthContext from '@/aplikasi/auth/AuthContext';
import TopNavBar from '@/aplikasi/layouts/navbar/TopNavBar';
import BottomNavbar from '@/aplikasi/layouts/navbar/BottomNavbar';
import SideNavbar from '@/aplikasi/layouts/navbar/SideNavbar';
import LoginOptionsModal from '@/aplikasi/components/modal/LoginOptionsModal';
// Pastikan hanya mengimpor satu set komponen navbar
import { 
    authDesktopMenuItems, 
    authMobileMenuItems, 
    guestDesktopMenuItems, 
    guestMobileMenuItems 
} from '@/aplikasi/layouts/menuConfig';

const DefaultLayout = ({ children }) => {
    // Dapatkan 'logout' dari AuthContext
    const { isAuthenticated, logout } = useContext(AuthContext);
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
    const desktopMenuItems = isAuthenticated 
        ? authDesktopMenuItems(logout)
        : guestDesktopMenuItems(handleLogin, handleRegister, () => setShowLoginModal(true));

    const mobileMenuItems = isAuthenticated 
        ? authMobileMenuItems(logout)
        : guestMobileMenuItems(handleLogin, handleRegister, () => setShowLoginModal(true));

    return (
        <div className="flex flex-col min-h-screen">
            <TopNavBar />

            <div className="flex flex-1">
                {/* Mengirim menu desktop ke SideNavbar */}
                <SideNavbar menuItems={desktopMenuItems} />
                
                <main className="flex-1 p-4 md:ml-38 mt-10">
                    {children}
                </main>
            </div>

            {/* Mengirim menu mobile ke BottomNavbar */}
            <BottomNavbar menuItems={mobileMenuItems} />

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