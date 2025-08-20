// resources/js/aplikasi/layouts/menuConfig.js

// Hanya impor ikon yang diperlukan di sini
import { 
        FaHome, 
        FaSignInAlt, 
        FaUserPlus, 
        FaCogs, 
        FaTachometerAlt, 
        FaChartBar, 
        FaUser 
    } from 'react-icons/fa';

// Menu untuk pengguna yang sudah login
export const authMenuItems = [
    { 
        label: 'Beranda', 
        path: '/dashboard',
        icon: FaHome, // Gunakan komponen ikon secara langsung
    },
    { 
        label: 'Laporan', 
        path: '/laporan', 
        icon: FaChartBar, // Gunakan komponen ikon secara langsung
    },
    { 
        label: 'User', 
        path: '/profile', 
        icon: FaUser, // Gunakan komponen ikon secara langsung
    },
];

// Menu untuk pengguna tamu (non-login) - sekarang adalah fungsi
export const guestMenuItems = (onLogin, onRegister, onOpenModal) => [
    { 
        label: 'Beranda', 
        path: '/',
        icon: FaHome, // Gunakan komponen ikon secara langsung
    },
    { 
        label: 'Login', 
        path: '/auth/login',
        icon: FaSignInAlt, // Gunakan komponen ikon secara langsung
        onClick: onOpenModal,
    },
    { 
        label: 'Register', 
        path: '/auth/register',
        icon: FaUserPlus, // Gunakan komponen ikon secara langsung
        onClick: onRegister,
    },
];