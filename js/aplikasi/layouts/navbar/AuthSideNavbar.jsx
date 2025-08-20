// resources/js/aplikasi/layouts/navbar/AuthSideNavbar.jsx

import React, { useState, useContext } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import AuthContext from '@/aplikasi/auth/AuthContext';
// Impor ikon dari react-icons.
import { FaHome, FaCog, FaChartBar, FaUser, FaChevronRight, FaSignOutAlt } from 'react-icons/fa';

const AuthSideNavbar = () => {
    const { logout } = useContext(AuthContext);
    const location = useLocation();
    const navigate = useNavigate();
    const [expandedMenu, setExpandedMenu] = useState(null);

    const handleLogout = () => {
        // Panggil fungsi logout dari AuthContext
        logout();
        setExpandedMenu(null);
        // Arahkan pengguna ke halaman utama atau halaman login
        navigate('/');
    };

    const isSubPathActive = (submenus) => {
        return submenus.some(sub => location.pathname.startsWith(sub.path));
    };

    const navItems = [
        { label: 'Beranda', path: '/', icon: <FaHome className="text-xl" /> },
        { label: 'Produksi', path: '/produksi', icon: <FaCog className="text-xl" /> },
        { label: 'Laporan', path: '/laporan', icon: <FaChartBar className="text-xl" /> },
        {
            label: 'User',
            path: '/user',
            icon: <FaUser className="text-xl" />,
            submenu: [
                { label: 'Profil', path: '/user/profile' },
                // Logout sekarang adalah item yang memicu aksi, bukan tautan
                { label: 'Logout', action: handleLogout },
            ],
        },
    ];

    const menuClasses = (path, hasSubmenu) => {
        const isActive = hasSubmenu
            ? isSubPathActive(navItems.find(item => item.path === path).submenu)
            : location.pathname === path;
        
        return `flex items-center space-x-3 p-2 rounded-lg transition-colors duration-200 cursor-pointer ${
            isActive ? 'bg-blue-100 text-blue-600 font-semibold' : 'text-gray-700 hover:bg-gray-100'
        }`;
    };

    return (
        <nav className="hidden md:block fixed top-18 left-0 w-38 h-full bg-white shadow-xl z-40 p-4">
            <div className="flex flex-col h-full justify-start mt-0">
                <ul className="space-y-2">
                    {navItems.map((item) => (
                        <li key={item.label}>
                            {item.submenu ? (
                                <>
                                    <div
                                        onClick={() =>
                                            setExpandedMenu(expandedMenu === item.label ? null : item.label)
                                        }
                                        className={`${menuClasses(item.path, true)} justify-between`}
                                    >
                                        <div className="flex items-center space-x-3">
                                            {item.icon}
                                            <span>{item.label}</span>
                                        </div>
                                        <FaChevronRight
                                            className={`transition-transform duration-200 ${
                                                expandedMenu === item.label ? 'rotate-90' : ''
                                            }`}
                                        />
                                    </div>
                                    {expandedMenu === item.label && (
                                        <ul className="pl-8 mt-1 space-y-1">
                                            {item.submenu.map((sub) => (
                                                <li key={sub.label}>
                                                    {/* Pengecekan untuk tautan atau aksi */}
                                                    {sub.path ? (
                                                        <Link
                                                            to={sub.path}
                                                            className={`block p-2 rounded-lg transition-colors duration-200 ${
                                                                location.pathname === sub.path
                                                                    ? 'bg-blue-100 text-blue-600 font-semibold'
                                                                    : 'text-gray-700 hover:bg-gray-100'
                                                            }`}
                                                        >
                                                            {sub.label}
                                                        </Link>
                                                    ) : (
                                                        <button
                                                            onClick={sub.action}
                                                            className="block w-full text-left p-2 rounded-lg transition-colors duration-200 text-red-600 hover:bg-red-100"
                                                        >
                                                            {sub.label}
                                                        </button>
                                                    )}
                                                </li>
                                            ))}
                                        </ul>
                                    )}
                                </>
                            ) : (
                                <Link
                                    to={item.path}
                                    className={menuClasses(item.path, false)}
                                >
                                    {item.icon}
                                    <span>{item.label}</span>
                                </Link>
                            )}
                        </li>
                    ))}
                    {/* Logout Button (Opsional jika Anda ingin di bawah) */}
                    {/* Hapus bagian ini jika Anda sudah menempatkan Logout di submenu */}
                </ul>
            </div>
        </nav>
    );
};

export default AuthSideNavbar;