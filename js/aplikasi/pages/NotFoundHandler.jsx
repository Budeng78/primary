import React, { useEffect } from 'react';
import { useLocation, Link } from 'react-router-dom';

const NotFoundHandler = () => {
    const location = useLocation();

    useEffect(() => {
        // Kirim data ke backend untuk logging 404
        fetch('/api/log-404', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
            },
            body: JSON.stringify({
                path: location.pathname,
                timestamp: new Date().toISOString(),
                userAgent: navigator.userAgent,
            }),
        }).catch((error) => {
            console.error('Gagal mengirim log 404:', error);
        });
    }, [location]);

    return (
        <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100 text-center p-8">
            <h1 className="text-4xl font-bold text-red-600 mb-4">404 - Halaman Tidak Ditemukan</h1>
            <p className="text-lg text-gray-700 mb-6">
                Alamat <code className="bg-gray-200 px-2 py-1 rounded">{location.pathname}</code> tidak tersedia.
            </p>
            <Link
                to="/"
                className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition"
            >
                Kembali ke Beranda
            </Link>
        </div>
    );
};

export default NotFoundHandler;