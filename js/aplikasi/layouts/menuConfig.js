// resources\js\aplikasi\layouts\menuConfig.js
// Hanya impor ikon yang diperlukan di sini
import { 
    FaHome, 
    FaSignInAlt, 
    FaUserPlus, 
    FaSignOutAlt, 
    FaTachometerAlt, 
    FaChartBar, 
    FaUser,
    FaUsers,
    FaMobileAlt, // Ikon untuk OTP
    FaList
} from 'react-icons/fa';

// Menu untuk pengguna yang sudah login (Desktop)
export const authDesktopMenuItems = (handleLogout) => [
    { 
        label: 'Beranda', 
        path: '/',
        icon: FaHome, 
    },
    {
        // ITEM KARYAWAN SEKARANG DROPDOWN
        label: 'Karyawan', 
        icon: FaUsers,
        children: [
            {
                label: 'List',
                path: '/karyawan/list',
                icon: FaList,
            },
            {
                label: 'Laporan', 
                path: '/karyawan/upload-foto', 
                icon: FaChartBar, 
            },
        ],
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
        path: '/',
        icon: FaHome, 
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
// TAMBAHAN: Menerima onOtp sebagai argumen
export const guestDesktopMenuItems = (onLogin, onRegister, onOpenModal, onOtp) => [
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

// Menu untuk pengguna tamu (Mobile)
// TAMBAHAN: Menerima onOtp sebagai argumen
export const guestMobileMenuItems = (onLogin, onRegister, onOpenModal, onOtp) => [
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
