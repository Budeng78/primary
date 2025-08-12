// resources/js/aplikasi/auth/utils/AuthProvider.jsx

import React, { useState, useEffect } from 'react';
import AuthContext from './AuthContext';

const AuthProvider = ({ children }) => {
    // 1. Inisialisasi state dengan memeriksa token di localStorage
    const [isAuthenticated, setIsAuthenticated] = useState(() => {
        return !!localStorage.getItem('token');
    });

    // 2. Fungsi untuk login
    const login = (token) => {
        localStorage.setItem('token', token);
        setIsAuthenticated(true);
    };

    // 3. Fungsi untuk logout
    const logout = () => {
        localStorage.removeItem('token');
        setIsAuthenticated(false);
    };

    // 4. useEffect untuk sinkronisasi jika localStorage berubah (optional, tapi bagus)
    useEffect(() => {
        const handleStorageChange = () => {
            setIsAuthenticated(!!localStorage.getItem('token'));
        };
        window.addEventListener('storage', handleStorageChange);
        return () => window.removeEventListener('storage', handleStorageChange);
    }, []);

    // 5. Value yang akan diberikan ke AuthContext.Provider
    const value = {
        isAuthenticated,
        login,
        logout,
    };

    return (
        <AuthContext.Provider value={value}>
            {children}
        </AuthContext.Provider>
    );
};

export default AuthProvider;