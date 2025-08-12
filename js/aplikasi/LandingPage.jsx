// pages/LandingPage.jsx
import React from 'react';

const LandingPage = () => {
    return (
        <div className="flex flex-col items-center justify-center p-8 text-center animate-fade-up delay-300 duration-700 bg-gray-50 min-h-screen">
            <h1 className="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-gray-900 mb-4">
                Selamat datang di Laravel dengan React dan Tailwind!
            </h1>
            <p className="text-lg text-gray-600 max-w-2xl mb-8">
                Ini adalah halaman landing page. Kamu bisa mulai membangun fitur-fitur keren di sini.
            </p>
            <button className="bg-blue-600 text-white font-bold py-3 px-6 rounded-full shadow-lg hover:bg-blue-700 transition-all duration-300 transform hover:scale-105">
                Mulai Sekarang
            </button>
        </div>
    );
};

export default LandingPage;