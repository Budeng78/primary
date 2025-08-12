// resources/js/aplikasi/App.jsx

import React, { lazy, Suspense, useState, useEffect } from 'react';
import { createRoot } from 'react-dom/client';
import {
    BrowserRouter as Router,
    Routes,
    Route,
    useNavigate,
    Navigate,
    Link,
} from 'react-router-dom';

import  AuthProvider  from '@/aplikasi/auth/AuthProvider'

// Lazy load halaman
const LandingPage = lazy(() => import('@/aplikasi/LandingPage'));
const NotFoundHandler = lazy(() => import('@/aplikasi/pages/NotFoundHandler'));
const Login = lazy(() => import('@/aplikasi/pages/auth/Login'));
const Register = lazy(() => import('@/aplikasi/pages/auth/Register'));


// import layout
import DefaultLayout from '@/aplikasi/layouts/DefaultLayout';


const App = () => (
    <Router>
        <DefaultLayout>
        <Suspense fallback={<div>Memuat halaman...</div>}>
            <Routes>
                <Route path="*" element={<NotFoundHandler />} />
                <Route path="/" element={<LandingPage /> } />
                <Route path="/auth/login" element={<Login />} />
                <Route path="/auth/register" element={<Register />} />  
                
                
            </Routes>
        </Suspense>
        </DefaultLayout>
    </Router>
);

const container = document.getElementById('app');
const root = createRoot(container);
root.render(
    <React.StrictMode>
        <AuthProvider>
            <App />
        </AuthProvider>
    </React.StrictMode>
);