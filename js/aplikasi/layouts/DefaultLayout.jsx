import React, { useContext } from 'react';
import TopNavBar from '@/aplikasi/layouts/navbar/TopNavBar';
import AuthBottomNavbar from '@/aplikasi/layouts/navbar/AuthBottomNavbar';
import GuestBottomNavbar from '@/aplikasi/layouts/navbar/GuestBottomNavbar';
import GuestSideNavbar from '@/aplikasi/layouts/navbar/GuestSideNavbar';
import AuthSideNavbar from '@/aplikasi/layouts/navbar/AuthSideNavbar';
import AuthContext from '@/aplikasi/auth/AuthContext';






const DefaultLayout = ({ children }) => {
    const { isAuthenticated } = useContext(AuthContext);
    //const isAuthenticated = true; // <--- Ubah di sini untuk tes
        return (
            <div className="flex flex-col min-h-screen">
            {/* Top Navbar harus selalu di atas dengan z-index yang tinggi */}
            <TopNavBar />

            <div className="flex flex-1">
                {/* Side Navbar akan berada di samping */}
                {isAuthenticated ? <AuthSideNavbar /> : <GuestSideNavbar />}
                    
                    
                    {/* Konten Utama */}
                    <main className="flex-1 p-4 md:ml-38 mt-10">
                        {children}
                    </main>
                </div>

                {/* Bottom Navbar (terlihat di layar mobile) */}
                {isAuthenticated ? <AuthBottomNavbar /> : <GuestBottomNavbar />}
            </div>
        );
    };

export default DefaultLayout;