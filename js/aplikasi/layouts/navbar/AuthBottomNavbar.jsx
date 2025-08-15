// resources/js/aplikasi/layouts/navbar/AuthBottomNavbar.jsx


import React, { useState, useContext } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { FaHome, FaCogs, FaChartBar, FaUser } from 'react-icons/fa';
import AuthContext from '@/aplikasi/auth/AuthContext'; // <--- Impor yang sudah diperbaiki

const AuthBottomNavbar = () => {
    const { logout } = useContext(AuthContext); // Ini akan berhasil

    const location = useLocation();
    const navigate = useNavigate();
    const [activeDropdown, setActiveDropdown] = useState(null);

    const handleLogout = () => {
        logout();
        setActiveDropdown(null);
    };

    const navItems = [
        { label: 'Beranda', path: '/', icon: <FaHome /> },
        { label: 'Produksi', path: '/produksi', icon: <FaCogs /> },
        { label: 'Laporan', path: '/laporan', icon: <FaChartBar /> },
        {
            label: 'User',
            path: '/user',
            icon: <FaUser />,
            submenu: [
                { label: 'Profil', path: '/user/profile' },
                { label: 'Logout', action: handleLogout },
            ],
        },
    ];

    return (
        <nav className="fixed bottom-0 left-0 right-0 bg-white border-t shadow-md z-50 md:hidden">
            <ul className="flex justify-around items-center py-2">
                {navItems.map((item) => (
                    <li key={item.label} className="relative">
                        {item.submenu ? (
                            <div
                                onClick={() =>
                                    setActiveDropdown(activeDropdown === item.label ? null : item.label)
                                }
                                className={`flex flex-col items-center text-xs cursor-pointer ${
                                    location.pathname.startsWith(item.path)
                                        ? 'text-blue-600 font-semibold'
                                        : 'text-gray-500'
                                }`}
                            >
                                <div className="text-xl mb-1">{item.icon}</div>
                                {item.label}
                            </div>
                        ) : (
                            <Link
                                to={item.path}
                                className={`flex flex-col items-center text-xs ${
                                    location.pathname === item.path
                                        ? 'text-blue-600 font-semibold'
                                        : 'text-gray-500'
                                }`}
                                onClick={() => setActiveDropdown(null)}
                            >
                                <div className="text-xl mb-1">{item.icon}</div>
                                {item.label}
                            </Link>
                        )}

                        {item.submenu && activeDropdown === item.label && (
                            <ul className="absolute bottom-12 left-1/2 -translate-x-1/2 bg-white border rounded shadow-md w-24 text-center z-50">
                                {item.submenu.map((sub) => (
                                    <li key={sub.label}>
                                        {sub.path ? (
                                            <Link
                                                to={sub.path}
                                                className="block px-2 py-1 text-sm text-gray-700 hover:bg-gray-100"
                                                onClick={() => setActiveDropdown(null)}
                                            >
                                                {sub.label}
                                            </Link>
                                        ) : (
                                            <div
                                                onClick={sub.action}
                                                className="block px-2 py-1 text-sm text-gray-700 hover:bg-gray-100 cursor-pointer"
                                            >
                                                {sub.label}
                                            </div>
                                        )}
                                    </li>
                                ))}
                            </ul>
                        )}
                    </li>
                ))}
            </ul>
        </nav>
    );
};

export default AuthBottomNavbar;