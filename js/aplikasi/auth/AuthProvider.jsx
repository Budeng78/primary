// resources/js/aplikasi/auth/AuthProvider.jsx

import React, { useState, useEffect, createContext } from 'react';
import { useNavigate } from 'react-router-dom';
import AuthContext from './AuthContext'; // Path diperbaiki

const AuthProvider = ({ children }) => {
    // Inisialisasi state dengan memeriksa token di localStorage saat komponen pertama kali dimuat
    const [isAuthenticated, setIsAuthenticated] = useState(() => {
        return !!localStorage.getItem('token');
    });

    const [user, setUser] = useState(null);
    const [authTimeoutId, setAuthTimeoutId] = useState(null);
    const navigate = useNavigate();

    // Waktu sesi dalam milidetik (misalnya, 30 menit)
    const SESSION_TIMEOUT = 30 * 60 * 1000;

    const startAuthTimer = () => {
        // Hapus timer yang ada jika ada
        if (authTimeoutId) {
            clearTimeout(authTimeoutId);
        }

        // Mulai timer baru
        const id = setTimeout(() => {
            console.log('Sesi berakhir. Logout otomatis.');
            logout();
        }, SESSION_TIMEOUT);
        setAuthTimeoutId(id);
    };

    const resetAuthTimer = () => {
        if (isAuthenticated) {
            startAuthTimer();
        }
    };
    
    // Fungsi login untuk menyimpan token dan memperbarui state
    const login = (token) => {
        try {
            // 1. Simpan token ke localStorage
            localStorage.setItem('token', token);
            // 2. Perbarui status otentikasi
            setIsAuthenticated(true);
            // Opsional: Anda dapat menyimpan data pengguna di sini jika tersedia
            // setUser(userData);
            startAuthTimer(); // Mulai timer saat login berhasil
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
            if (authTimeoutId) {
                clearTimeout(authTimeoutId);
            }
        } catch (error) {
            console.error("Gagal menghapus token dari localStorage:", error);
        }
        navigate('/auth/login');
    };

    // Reset timer setiap kali ada interaksi pengguna
    useEffect(() => {
        const handleInteraction = () => {
            resetAuthTimer();
        };

        window.addEventListener('mousemove', handleInteraction);
        window.addEventListener('keydown', handleInteraction);
        window.addEventListener('click', handleInteraction);

        return () => {
            window.removeEventListener('mousemove', handleInteraction);
            window.removeEventListener('keydown', handleInteraction);
            window.removeEventListener('click', handleInteraction);
        };
    }, [isAuthenticated]);

    // Hapus timer saat komponen tidak ter-render atau saat logout
    useEffect(() => {
        return () => {
            if (authTimeoutId) {
                clearTimeout(authTimeoutId);
            }
        };
    }, [authTimeoutId]);

    const value = {
        isAuthenticated,
        user,
        login,
        logout,
        resetAuthTimer,
    };

    return (
        <AuthContext.Provider value={value}>
            {children}
        </AuthContext.Provider>
    );
};

export default AuthProvider;
