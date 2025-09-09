import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { FaEllipsisV, FaPencilAlt, FaEye, FaTrashAlt, FaPlus } from 'react-icons/fa';

const KaryawanList = () => {
    // State untuk menyimpan data karyawan
    const [employees, setEmployees] = useState([]);
    // State untuk mengelola status loading
    const [loading, setLoading] = useState(true);
    // State untuk menyimpan pesan error jika terjadi
    const [error, setError] = useState(null);
    // State untuk mengelola dropdown yang terbuka
    const [openDropdownId, setOpenDropdownId] = useState(null);
    // State untuk mengelola modal konfirmasi hapus
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [employeeToDelete, setEmployeeToDelete] = useState(null);
    // State untuk pesan notifikasi (alert)
    const [notification, setNotification] = useState({ message: '', type: '' });

    // Hook untuk navigasi
    const navigate = useNavigate();

    // Ref untuk setiap dropdown
    const dropdownRefs = useRef({});

    // Fungsi utilitas untuk memformat tanggal dari format ISO ke YYYY-MM-DD
    const formatDate = (dateString) => {
        if (!dateString) return '-';
        try {
            const date = new Date(dateString);
            return date.toISOString().split('T')[0];
        } catch (e) {
            console.error("Invalid date format:", dateString);
            return dateString;
        }
    };

    // Fungsi untuk menampilkan notifikasi
    const showNotification = (message, type = 'success') => {
        setNotification({ message, type });
        setTimeout(() => setNotification({ message: '', type: '' }), 5000); // Sembunyikan setelah 5 detik
    };

    // Fungsi untuk mengambil data karyawan dari API
    const getEmployees = async () => {
        setLoading(true);
        setError(null);

        const token = localStorage.getItem('token');

        if (!token) {
            setError('Anda tidak memiliki token otentikasi. Silakan login.');
            setLoading(false);
            navigate('/auth/login');
            return;
        }

        try {
            const response = await axios.get('/api/karyawan', {
                headers: {
                    Authorization: `Bearer ${token}`
                }
            });

            const data = response.data;

            if (Array.isArray(data)) {
                // Memformat data tanggal sebelum disimpan ke state
                const formattedData = data.map(employee => ({
                    ...employee,
                    masuk_kerja: formatDate(employee.masuk_kerja),
                    ditetapkan: formatDate(employee.ditetapkan)
                }));
                setEmployees(formattedData);
            } else {
                throw new Error("Format data tidak sesuai, bukan array.");
            }
        } catch (err) {
            console.error("Error fetching employee data:", err);
            if (err.response && err.response.status === 401) {
                setError('Sesi Anda telah berakhir atau token tidak valid. Silakan login kembali.');
                navigate('/auth/login');
            } else {
                setError("Gagal mengambil data karyawan. Silakan coba lagi.");
            }
        } finally {
            setLoading(false);
        }
    };

    // Fungsi untuk memulai proses penghapusan (menampilkan modal)
    const handleDeleteClick = (employeeId) => {
        setEmployeeToDelete(employeeId);
        setShowDeleteModal(true);
        setOpenDropdownId(null);
    };

    // Fungsi untuk menghapus karyawan setelah konfirmasi
    const confirmDelete = async () => {
        setShowDeleteModal(false);
        if (!employeeToDelete) return;

        const token = localStorage.getItem('token');
        if (!token) {
            showNotification('Anda tidak memiliki token otentikasi. Silakan login.', 'error');
            navigate('/auth/login');
            return;
        }

        try {
            await axios.delete(`/api/karyawan/${employeeToDelete}`, {
                headers: {
                    Authorization: `Bearer ${token}`
                }
            });
            setEmployees(employees.filter(emp => emp.no_id !== employeeToDelete));
            showNotification('Data karyawan berhasil dihapus!', 'success');
        } catch (err) {
            console.error("Error deleting employee data:", err);
            if (err.response && err.response.status === 401) {
                showNotification('Sesi Anda telah berakhir. Silakan login kembali.', 'error');
                navigate('/auth/login');
            } else {
                showNotification('Gagal menghapus data karyawan. Silakan coba lagi.', 'error');
            }
        } finally {
            setEmployeeToDelete(null);
        }
    };

    // Fungsi untuk navigasi ke halaman detail
    const handleDetail = (employeeId) => {
    if (!employeeId) return; // antisipasi jika id kosong/null
    navigate(`/karyawan/detail/${employeeId}`);
    setOpenDropdownId(null); // tutup dropdown setelah klik
    };

    // Fungsi untuk navigasi ke halaman edit
    const handleEdit = (employeeId) => {
        navigate(`/karyawan/edit/${employeeId}`);
        setOpenDropdownId(null);
    };
    
    // Fungsi untuk navigasi ke halaman tambah karyawan
    const handleAdd = () => {
        navigate('/karyawan/create');
    };

    // Mengelola status buka/tutup dropdown
    const toggleDropdown = (id) => {
        setOpenDropdownId(openDropdownId === id ? null : id);
    };

    // Fungsi untuk menutup dropdown saat klik di luar
    useEffect(() => {
        const handleClickOutside = (event) => {
            // Periksa apakah ada dropdown yang terbuka
            if (openDropdownId && dropdownRefs.current[openDropdownId] && !dropdownRefs.current[openDropdownId].contains(event.target)) {
                setOpenDropdownId(null);
            }
        };

        // Tambahkan event listener saat komponen di-mount
        document.addEventListener("mousedown", handleClickOutside);

        // Hapus event listener saat komponen di-unmount
        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, [openDropdownId]);

    // Hook untuk memuat data saat komponen pertama kali dirender
    useEffect(() => {
        getEmployees();
    }, [navigate]);

    if (loading) {
        return (
            <div className="flex justify-center items-center h-screen">
                <div className="animate-spin rounded-full h-16 w-16 border-t-2 border-b-2 border-purple-500"></div>
                <p className="ml-4 text-gray-700">Memuat data karyawan...</p>
            </div>
        );
    }

    if (error) {
        return (
            <div className="flex justify-center items-center h-screen text-red-500">
                <p>{error}</p>
            </div>
        );
    }

    return (
        <div className="container h-16 mx-auto p-4 md:p-8">
            <div className="bg-white shadow-xl rounded-2xl p-6 md:p-10">
                <h1 className="text-lg font-bold text-center mb-6 text-black">Daftar Karyawan Primary</h1>
                <div className="flex justify-end mb-4">
                    <button
                        onClick={handleAdd}
                        className="flex items-center px-5 py-2 bg-indigo-600 text-white font-semibold text-base rounded-full shadow-md hover:bg-indigo-700 transition duration-300 ease-in-out transform hover:scale-105"
                    >
                        <FaPlus className="mr-2" /> Karyawan
                    </button>
                </div>
                {notification.message && (
                    <div className={`p-4 mb-4 rounded-lg text-center ${notification.type === 'success' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                        {notification.message}
                    </div>
                )}
                {employees.length === 0 ? (
                    <p className="text-center text-gray-500">Tidak ada data karyawan yang tersedia.</p>
                ) : (
                    <div className="overflow-x-auto">
                        <table className="min-w-full bg-white rounded-lg overflow-hidden border-collapse text-sm">
                            <thead className="bg-gray-100">
                                <tr className="text-black uppercase font-semibold leading-normal">
                                    <th className="py-3 px-4 text-left border-b border-gray-300">No</th>
                                    <th className="py-3 px-4 text-left border-b border-gray-300">Nama</th>
                                    <th className="py-3 px-4 text-left border-b border-gray-300">Sub Bagian</th>
                                    <th className="py-3 px-4 text-left border-b border-gray-300">Kelompok Kerja</th>
                                    <th className="py-3 px-4 text-left border-b border-gray-300">Tanggal Masuk</th>
                                    <th className="py-3 px-4 text-left border-b border-gray-300">Ditetapkan</th>
                                    <th className="py-3 px-4 text-left border-b border-gray-300">Aksi</th>
                                </tr>
                            </thead>
                            <tbody className="text-black divide-y divide-gray-200">
                                {employees.map((employee, index) => (
                                    <tr key={employee.no_id || index} className="hover:bg-gray-50 font-semibold">
                                        <td className="py-3 px-4">{index + 1}</td>
                                        <td className="py-3 px-4">{employee.nama || '-'}</td>
                                        <td className="py-3 px-4">{employee.sub_bagian || '-'}</td>
                                        <td className="py-3 px-4">{employee.kelompok_kerja || '-'}</td>
                                        <td className="py-3 px-4">{employee.masuk_kerja}</td>
                                        <td className="py-3 px-4">{employee.ditetapkan}</td>
                                        <td className="py-3 px-4">
                                            <div className="relative" ref={el => dropdownRefs.current[employee.no_id] = el}>
                                                <button
                                                    onClick={() => toggleDropdown(employee.no_id)}
                                                    className="p-1 rounded-full hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                                                >
                                                    <FaEllipsisV className="w-4 h-4 text-gray-500" />
                                                </button>
                                                {openDropdownId === employee.no_id && (
                                                    <div className="absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-xl z-10">
                                                        <div className="py-1">
                                                            <button
                                                                onClick={() => handleDetail(employee.no_id)}
                                                                className="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 w-full text-left"
                                                            >
                                                                <FaEye className="w-4 h-4 mr-2 text-blue-500" /> Detail
                                                            </button>
                                                            <button
                                                                onClick={() => handleEdit(employee.no_id)}
                                                                className="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 w-full text-left"
                                                            >
                                                                <FaPencilAlt className="w-4 h-4 mr-2 text-yellow-500" /> Edit
                                                            </button>
                                                            <button
                                                                onClick={() => handleDeleteClick(employee.no_id)}
                                                                className="flex items-center px-4 py-2 text-sm text-red-600 hover:bg-gray-100 w-full text-left"
                                                            >
                                                                <FaTrashAlt className="w-4 h-4 mr-2 text-red-600" /> Hapus
                                                            </button>
                                                        </div>
                                                    </div>
                                                )}
                                            </div>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                )}
            </div>
            {/* Modal Konfirmasi Hapus */}
            {showDeleteModal && (
                <div className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50">
                    <div className="bg-white rounded-lg shadow-xl p-6 w-96">
                        <h2 className="text-xl font-bold mb-4">Konfirmasi Hapus</h2>
                        <p className="text-gray-700 mb-6">Apakah Anda yakin ingin menghapus data karyawan ini?</p>
                        <div className="flex justify-end space-x-4">
                            <button
                                onClick={() => setShowDeleteModal(false)}
                                className="px-4 py-2 bg-gray-300 text-gray-800 font-semibold rounded-lg hover:bg-gray-400 transition duration-300"
                            >
                                Batal
                            </button>
                            <button
                                onClick={confirmDelete}
                                className="px-4 py-2 bg-red-600 text-white font-semibold rounded-lg hover:bg-red-700 transition duration-300"
                            >
                                Hapus
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};

export default KaryawanList;
