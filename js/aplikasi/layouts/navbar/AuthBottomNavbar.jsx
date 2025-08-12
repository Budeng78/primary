import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import { FaHome, FaCogs, FaChartBar, FaUser } from 'react-icons/fa';

const AuthBottomNavbar = () => {
    const location = useLocation();
    const navItems = [
        { label: 'Beranda', path: '/', icon: <FaHome /> },
        { label: 'Produksi', path: '/produksi', icon: <FaCogs /> },
        { label: 'Laporan', path: '/laporan', icon: <FaChartBar /> },
        { label: 'Profil', path: '/profil', icon: <FaUser /> },
    ];

    return (
        <nav className="fixed bottom-0 left-0 right-0 bg-white border-t shadow-md z-50 md:hidden">
            <ul className="flex justify-around items-center py-2">
                {navItems.map((item) => (
                    <li key={item.path}>
                        <Link
                            to={item.path}
                            className={`flex flex-col items-center text-xs ${
                                location.pathname === item.path
                                    ? 'text-blue-600 font-semibold'
                                    : 'text-gray-500'
                            }`}
                        >
                            <div className="text-xl mb-1">{item.icon}</div>
                            {item.label}
                        </Link>
                    </li>
                ))}
            </ul>
        </nav>
    );
};

export default AuthBottomNavbar;