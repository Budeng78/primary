// resources/js/aplikasi/layouts/navbar/SideNavbar.jsx

import React from 'react';
import { Link, useLocation } from 'react-router-dom';

const SideNavbar = ({ menuItems }) => {
    const location = useLocation();

    if (!menuItems || menuItems.length === 0) {
        return null;
    }

    return (
        <nav className="hidden md:block fixed top-18 left-0 w-38 h-full bg-white shadow-xl z-40 p-4">
            <div className="flex flex-col h-full justify-between">
                <ul className="space-y-2"> 
                    {menuItems.map((item, index) => (
                        <li key={index}>
                            {item.onClick ? (
                                <button
                                    onClick={item.onClick}
                                    className="w-full text-left flex items-center space-x-3 p-2 rounded-lg transition-colors duration-200 text-gray-500 hover:bg-gray-100"
                                >
                                    <span className="text-xl">{item.icon && <item.icon />}</span>
                                    <span>{item.label}</span>
                                </button>
                            ) : (
                                <Link
                                    to={item.path}
                                    className={`flex items-center space-x-3 p-2 rounded-lg transition-colors duration-200 ${
                                        (location.pathname === item.path) ? 'bg-blue-100 text-blue-600 font-semibold' : 'text-gray-500 hover:bg-gray-100'
                                    }`}
                                >
                                    <span className="text-xl">{item.icon && <item.icon />}</span>
                                    <span>{item.label}</span>
                                </Link>
                            )}
                        </li>
                    ))}
                </ul>
            </div>
        </nav>
    );
};

export default SideNavbar;
