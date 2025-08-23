// resources/js/aplikasi/App.jsx

import React, { lazy, Suspense } from 'react';
import { createRoot } from 'react-dom/client';
import {
    BrowserRouter,
    Routes,
    Route,
    useNavigate,
    Navigate,
    Link,
} from 'react-router-dom';

// Impor AuthProvider (pastikan jalur ini benar)
import AuthProvider from '@/aplikasi/auth/AuthProvider';

// Lazy load halaman
const LandingPage = lazy(() => import('@/aplikasi/LandingPage'));
const NotFoundHandler = lazy(() => import('@/aplikasi/components/modal/NotFoundModal'));
const Login = lazy(() => import('@/aplikasi/pages/2.auth/Login'));
const Register = lazy(() => import('@/aplikasi/pages/2.auth/Register'));

// Impor layout
import DefaultLayout from '@/aplikasi/layouts/DefaultLayout';

const App = () => (
    <BrowserRouter>
        <AuthProvider>
            <DefaultLayout>
                <Suspense fallback={<div>Memuat halaman...</div>}>
                    <Routes>
                        <Route path="/" element={<LandingPage />} />
                        <Route path="/auth/login" element={<Login />} />
                        <Route path="/auth/register" element={<Register />} />
                        <Route path="*" element={<NotFoundHandler />} />
                    </Routes>
                </Suspense>
            </DefaultLayout>
        </AuthProvider>
    </BrowserRouter>
);

const container = document.getElementById('app');
const root = createRoot(container);
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);