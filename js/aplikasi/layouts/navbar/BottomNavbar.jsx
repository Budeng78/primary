// resources/js/aplikasi/layouts/navbar/BottomNavbar.jsx

import React from 'react';
import { Link, useLocation } from 'react-router-dom';

const BottomNavbar = ({ menuItems }) => {
    const location = useLocation();

    return (
        <nav className="fixed bottom-0 left-0 right-0 bg-white border-t shadow-md z-50 md:hidden">
            <ul className="flex justify-around items-center py-2">
                {menuItems.map((item, index) => (
                    <li key={index}>
                        {item.onClick ? (
                            <button
                                onClick={item.onClick}
                                className="flex flex-col items-center text-xs text-gray-500 hover:text-blue-600"
                            >
                                <div className="text-xl mb-1">{item.icon && <item.icon />}</div>
                                {item.label}
                            </button>
                        ) : (
                            <Link
                                to={item.path}
                                className={`flex flex-col items-center text-xs ${
                                    (item.path && location.pathname === item.path) ? 'text-blue-600 font-semibold' : 'text-gray-500'
                                }`}
                            >
                                <div className="text-xl mb-1">{item.icon && <item.icon />}</div>
                                {item.label}
                            </Link>
                        )}
                    </li>
                ))}
            </ul>
        </nav>
    );
};

export default BottomNavbar;

