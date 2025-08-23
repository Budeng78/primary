// resources/js/aplikasi/layouts/menuConfig.js

// Hanya impor ikon yang diperlukan di sini
import { 
    FaHome, 
    FaSignInAlt, 
    FaUserPlus, 
    FaSignOutAlt, 
    FaTachometerAlt, 
    FaChartBar, 
    FaUser,
    FaUsers // Impor ikon untuk menu karyawan
} from 'react-icons/fa';

// Menu untuk pengguna yang sudah login (Desktop)
export const authDesktopMenuItems = (handleLogout) => [
    { 
        label: 'Beranda', 
        path: '/dashboard',
        icon: FaHome, 
    },
    { 
        label: 'Laporan', 
        path: '/laporan', 
        icon: FaChartBar, 
    },
    {
        label: 'Karyawan', 
        path: '/karyawan',
        icon: FaUsers,
    },
    {
        label: 'User', // Item menu utama untuk dropdown (Desktop)
        icon: FaUser,
        children: [ 
            {
                label: 'Profil',
                path: '/profile',
                icon: FaUser
            },
            {
                label: 'Logout',
                icon: FaSignOutAlt,
                onClick: handleLogout
            }
        ]
    }
];

// Menu untuk pengguna yang sudah login (Mobile)
export const authMobileMenuItems = (handleLogout) => [
    { 
        label: 'Beranda', 
        path: '/dashboard',
        icon: FaTachometerAlt, 
    },
    { 
        label: 'Laporan', 
        path: '/laporan', 
        icon: FaChartBar, 
    },
    
    {
        label: 'User', // Menggabungkan Profil dan Logout ke dalam dropdown User
        icon: FaUser,
        children: [
            {
                label: 'Profil',
                path: '/profile',
                icon: FaUser
            },
            {
                label: 'Logout',
                icon: FaSignOutAlt,
                onClick: handleLogout
            }
        ]
    }
];

// Menu untuk pengguna tamu (Desktop)
export const guestDesktopMenuItems = (onLogin, onRegister, onOpenModal) => [
    { 
        label: 'Beranda', 
        path: '/',
        icon: FaHome,
    },
    { 
        label: 'Login', 
        path: '/auth/login',
        icon: FaSignInAlt,
        onClick: onOpenModal,
    },
    { 
        label: 'Register', 
        path: '/auth/register',
        icon: FaUserPlus,
        onClick: onRegister,
    },
];

// Menu untuk pengguna tamu (Mobile)
export const guestMobileMenuItems = (onLogin, onRegister, onOpenModal) => [
    { 
        label: 'Beranda', 
        path: '/',
        icon: FaHome,
    },
    { 
        label: 'Login', 
        path: '/auth/login',
        icon: FaSignInAlt,
        onClick: onOpenModal,
    },
   
];