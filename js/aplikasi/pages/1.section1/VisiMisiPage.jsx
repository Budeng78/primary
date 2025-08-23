// resources\js\aplikasi\pages\1.section1\VisiMisiPage.jsx
import React from 'react';
import DefaultLayout from '@/aplikasi/layouts/DefaultLayout';

const VisiMisiPage = () => {
    return (
        <DefaultLayout>
            <div className="container mx-auto px-4 py-8">
                <h1 className="text-4xl font-bold text-center text-blue-800 mb-6">Visi & Misi Perusahaan</h1>
                
                <div className="bg-white p-6 rounded-lg shadow-md mb-8">
                    <h2 className="text-2xl font-semibold text-blue-700 mb-4">Visi</h2>
                    <p className="text-gray-700 leading-relaxed">
                        Menjadi perusahaan terdepan dalam industri... (Isi dengan visi Anda)
                    </p>
                </div>

                <div className="bg-white p-6 rounded-lg shadow-md">
                    <h2 className="text-2xl font-semibold text-blue-700 mb-4">Misi</h2>
                    <ul className="list-disc list-inside text-gray-700 space-y-2">
                        <li>Misi pertama...</li>
                        <li>Misi kedua...</li>
                        <li>Misi ketiga...</li>
                    </ul>
                </div>
            </div>
        </DefaultLayout>
    );
};

export default VisiMisiPage;