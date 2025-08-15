import React, { useContext } from 'react';
import TopNavBar from '@/aplikasi/layouts/navbar/TopNavBar';
import AuthBottomNavbar from '@/aplikasi/layouts/navbar/AuthBottomNavbar';
import GuestBottomNavbar from '@/aplikasi/layouts/navbar/GuestBottomNavbar';
import AuthContext from '@/aplikasi/auth/AuthContext';






const DefaultLayout = ({ children }) => {
    const { isAuthenticated } = useContext(AuthContext);
    //const isAuthenticated = true; // <--- Ubah di sini untuk tes
    return (
        
        <>
            <TopNavBar />
            <main>{children}</main>
            {isAuthenticated ? <AuthBottomNavbar /> : <GuestBottomNavbar />}

        </>
    );
};

export default DefaultLayout;