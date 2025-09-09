// resources/js/aplikasi/utils/apiUtils.js

import axios from 'axios';

/**
 * Fungsi untuk mengambil semua data karyawan dari API.
 * @returns {Promise<Array>} Data daftar karyawan.
 */
export const fetchEmployees = async () => {
  try {
    const response = await axios.get('/api/karyawan');
    return response.data;
  } catch (error) {
    console.error("Error fetching employee data:", error);
    // Melempar error agar komponen yang memanggil bisa menanganinya
    throw error;
  }
};
