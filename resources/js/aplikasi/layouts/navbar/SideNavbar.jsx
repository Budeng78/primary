// resources/js/aplikasi/layouts/navbar/SideNavbar.jsx

import React, { useState } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { FaAngleRight } from 'react-icons/fa';



const SideNavbar = ({ menuItems }) => {
    const location = useLocation();
    const [openIndex, setOpenIndex] = useState(null);

    if (!menuItems || menuItems.length === 0) return null;

    return (
        <nav className="hidden md:block fixed top-18 left-0 w-38 h-full bg-white shadow-xl z-40 p-4">
            <div className="flex flex-col h-full justify-between">
                <ul className="space-y-2">
                    {menuItems.map((item, index) => (
                        <li key={index}>
                            {item.children ? (
                                <div>
                                    <button
                                        onClick={() => setOpenIndex(openIndex === index ? null : index)}
                                        className="w-full text-left flex items-center justify-between space-x-3 p-2 rounded-lg transition-colors duration-200 text-gray-500 hover:bg-gray-100"
                                    >
                                        <div className="flex items-center space-x-3">
                                            <span className="text-xl">{item.icon && <item.icon />}</span>
                                            <span>{item.label}</span>
                                        </div>
                                        <span
                                            className={`transition-transform duration-200 ${
                                                openIndex === index ? 'rotate-90' : ''
                                            }`}
                                            >
                                            <FaAngleRight />
                                            </span>
                                    </button>

                                    {openIndex === index && (
                                        <ul className="ml-6 mt-1 space-y-1">
                                            {item.children.map((child, childIndex) => (
                                                <li key={childIndex}>
                                                    {child.onClick ? (
                                                        <button
                                                            onClick={child.onClick}
                                                            className="w-full text-left flex items-center space-x-2 p-2 rounded-md text-gray-500 hover:bg-gray-100"
                                                        >
                                                            <span className="text-lg">{child.icon && <child.icon />}</span>
                                                            <span>{child.label}</span>
                                                        </button>
                                                    ) : (
                                                        <Link
                                                            to={child.path}
                                                            className={`flex items-center space-x-2 p-2 rounded-md transition-colors duration-200 ${
                                                                location.pathname === child.path
                                                                    ? 'bg-blue-100 text-blue-600 font-semibold'
                                                                    : 'text-gray-500 hover:bg-gray-100'
                                                            }`}
                                                        >
                                                            <span className="text-lg">{child.icon && <child.icon />}</span>
                                                            <span>{child.label}</span>
                                                        </Link>
                                                    )}
                                                </li>
                                            ))}
                                        </ul>
                                    )}
                                </div>
                            ) : item.onClick ? (
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
                                        location.pathname === item.path
                                            ? 'bg-blue-100 text-blue-600 font-semibold'
                                            : 'text-gray-500 hover:bg-gray-100'
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