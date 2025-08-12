import React from 'react';

// 1. Add `onLogin` and `onRegister` to the destructured props list.
const LoginOptionsModal = ({ isOpen, onClose, onLogin, onRegister }) => {
    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center">
            {/* The backdrop blur effect */}
            <div
                className="absolute inset-0 bg-black/30 backdrop-blur-sm"
                onClick={onClose} // Optional: You can add an onClick handler here to close the modal when clicking outside the content area.
            ></div>

            {/* The modal content container */}
            <div className="relative bg-white rounded-lg p-6 w-80 shadow-lg z-10">
                <h2 className="text-lg font-semibold mb-4 text-center">Pilih Aksi</h2>
                <div className="space-y-3">
                    {/* 2. Add an onClick handler to the Login button */}
                    <button
                        onClick={onLogin}
                        className="w-full py-2 px-4 bg-blue-600 text-white rounded hover:bg-blue-700"
                    >
                        Login
                    </button>
                    <button
                        onClick={onRegister} // This is already in your code, but now it will work correctly.
                        className="w-full py-2 px-4 bg-green-600 text-white rounded hover:bg-green-700"
                    >
                        Register
                    </button>

                    <button className="w-full py-2 px-4 bg-yellow-500 text-white rounded hover:bg-yellow-600">
                        OTP
                    </button>
                </div>
                <button
                    onClick={onClose}
                    className="mt-4 text-sm text-gray-500 hover:text-gray-700 block mx-auto"
                >
                    Tutup
                </button>
            </div>
        </div>
    );
};

export default LoginOptionsModal;