// resources/js/aplikasi/pages/auth/Login.jsx
import React, { useState, useContext } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import axios from 'axios';
import AuthContext from '@/aplikasi/auth/AuthContext';

const Login = () => {
    const [form, setForm] = useState({
        email: '',
        password: '',
    });
    const [error, setError] = useState(null);
    const navigate = useNavigate();
    const { login } = useContext(AuthContext);

    const handleChange = e => {
        const { name, value } = e.target;
        setForm(prev => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async e => {
        e.preventDefault();
        setError(null); // Reset error saat submit

        try {
            const response = await axios.post('/api/login', form);
            const token = response.data?.access_token;
            // Dapatkan data pengguna dari respons API
            const user = response.data?.user;

            console.log("Respons API login:", response.data);
            
            if (token && user) {
                // Panggil fungsi login dengan token DAN data pengguna
                login(token, user); 
                navigate('/'); // Mengarahkan ke halaman dashboard
            } else {
                throw new Error('Token atau data pengguna tidak ditemukan');
            }
        } catch (err) {
            console.error('Login error:', err);
            // Menampilkan pesan error dari API, jika ada
            setError(err.response?.data?.message || err.message || 'Login gagal');
        }
    };

    return (
        <div className="min-h-screen flex items-center justify-center bg-gray-100 p-4">
            <form onSubmit={handleSubmit} className="bg-white p-6 rounded shadow-md w-full max-w-sm">
                <h2 className="text-2xl font-bold mb-4 text-center">Login</h2>
                {error && <p className="text-red-500 text-center mb-4">{error}</p>}

                <div className="mb-4">
                    <input
                        type="email"
                        name="email"
                        placeholder="Email"
                        autoComplete="username"
                        value={form.email}
                        onChange={handleChange}
                        className="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
                        required
                    />
                </div>

                <div className="mb-6">
                    <input
                        type="password"
                        name="password"
                        placeholder="Password"
                        autoComplete="current-password"
                        value={form.password}
                        onChange={handleChange}
                        className="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
                        required
                    />
                </div>

                <button type="submit" className="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">
                    Masuk
                </button>

                <p className="mt-4 text-sm text-center">
                    Belum punya akun?{' '}
                    <Link to="/register" className="text-blue-600 hover:underline">
                        Daftar
                    </Link>
                </p>
            </form>
        </div>
    );
};

export default Login;
