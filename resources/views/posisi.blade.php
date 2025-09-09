<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Karyawan</title>
    <!-- Tailwind CSS CDN untuk styling -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
        }
    </style>
</head>
<body>
    <div class="container mx-auto p-4 md:p-8">
        <div class="bg-white shadow-xl rounded-2xl px-6 py-4 md:px-10 md:py-6">
            <!-- Judul Halaman -->
            <h1 class="text-3xl font-bold text-center mb-6 text-black">Daftar Karyawan</h1>

            <!-- Tombol Tambah Karyawan -->
            <div class="flex justify-end mb-4">
                <button
                    class="flex items-center px-4 py-2 bg-green-600 text-white font-semibold rounded-lg hover:bg-green-700 transition duration-300"
                    aria-label="Tambah Karyawan"
                >
                    <!-- Icon Tambah (SVG) -->
                    <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path>
                    </svg>
                    Tambah Karyawan
                </button>
            </div>

            <!-- Tabel Data Karyawan -->
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white rounded-lg overflow-hidden border-collapse text-sm">
                    <thead class="bg-gray-100">
                        <tr class="text-black uppercase font-semibold leading-normal">
                            <th class="py-3 px-4 text-left border-b border-gray-300">No</th>
                            <th class="py-3 px-4 text-left border-b border-gray-300">Nama</th>
                            <th class="py-3 px-4 text-left border-b border-gray-300">Sub Bagian</th>
                            <th class="py-3 px-4 text-left border-b border-gray-300">Kelompok Kerja</th>
                            <th class="py-3 px-4 text-left border-b border-gray-300">Tanggal Masuk</th>
                            <th class="py-3 px-4 text-left border-b border-gray-300">Ditetapkan</th>
                            <th class="py-3 px-4 text-left border-b border-gray-300">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="text-black divide-y divide-gray-200">
                        <!-- Contoh Baris Data -->
                        <tr class="hover:bg-gray-50 font-semibold">
                            <td class="py-3 px-4">1</td>
                            <td class="py-3 px-4">Budi Santoso</td>
                            <td class="py-3 px-4">Produksi</td>
                            <td class="py-3 px-4">Tim A</td>
                            <td class="py-3 px-4">2023-01-15</td>
                            <td class="py-3 px-4">2023-07-15</td>
                            <td class="py-3 px-4">
                                <div class="relative">
                                    <button class="p-1 rounded-full hover:bg-gray-200 focus:outline-none">
                                        <!-- Icon Tiga Titik Vertikal (SVG) -->
                                        <svg class="w-4 h-4 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M10 6a2 2 0 110-4 2 2 0 010 4zm0 8a2 2 0 110-4 2 2 0 010 4zm-2 2a2 2 0 104 0 2 2 0 00-4 0z"></path>
                                        </svg>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <!-- Contoh Baris Data lainnya -->
                        <tr class="hover:bg-gray-50 font-semibold">
                            <td class="py-3 px-4">2</td>
                            <td class="py-3 px-4">Siti Aminah</td>
                            <td class="py-3 px-4">Pemasaran</td>
                            <td class="py-3 px-4">Tim B</td>
                            <td class="py-3 px-4">2022-03-10</td>
                            <td class="py-3 px-4">2022-09-10</td>
                            <td class="py-3 px-4">
                                <div class="relative">
                                    <button class="p-1 rounded-full hover:bg-gray-200 focus:outline-none">
                                        <svg class="w-4 h-4 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M10 6a2 2 0 110-4 2 2 0 010 4zm0 8a2 2 0 110-4 2 2 0 010 4zm-2 2a2 2 0 104 0 2 2 0 00-4 0z"></path>
                                        </svg>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <!-- Baris kosong jika tidak ada data -->
                        <tr>
                            <td colspan="7" class="py-8 text-center text-gray-500">
                                <!-- Tulisan ini akan muncul jika data kosong -->
                                <!-- Tidak ada data karyawan yang tersedia. -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
