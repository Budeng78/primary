// resources/js/aplikasi/auth/AuthProvider.jsx

import React, { useState, useEffect, createContext } from 'react';
import AuthContext from './AuthContext'; // Path diperbaiki

const AuthProvider = ({ children }) => {
    // Inisialisasi state dengan memeriksa token di localStorage saat komponen pertama kali dimuat
    const [isAuthenticated, setIsAuthenticated] = useState(() => {
        return !!localStorage.getItem('token');
    });

    const [user, setUser] = useState(null);

    // Fungsi login untuk menyimpan token dan memperbarui state
    const login = (token) => {
        try {
            // 1. Simpan token ke localStorage
            localStorage.setItem('token', token);
            // 2. Perbarui status otentikasi
            setIsAuthenticated(true);
            // Opsional: Anda dapat menyimpan data pengguna di sini jika tersedia
            // setUser(userData);
        } catch (error) {
            console.error("Gagal menyimpan token di localStorage:", error);
        }
    };

    // Fungsi logout untuk menghapus token dan mereset state
    const logout = () => {
        try {
            // 1. Hapus token dari localStorage
            localStorage.removeItem('token');
            // 2. Perbarui status otentikasi
            setIsAuthenticated(false);
            // 3. Hapus data pengguna
            setUser(null);
        } catch (error) {
            console.error("Gagal menghapus token dari localStorage:", error);
        }
    };

    const value = {
        isAuthenticated,
        user,
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
