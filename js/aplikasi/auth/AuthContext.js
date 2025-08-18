//resources\js\aplikasi\auth\AuthContext.jsx

import { createContext } from 'react';

// Create a context with an initial value
// This helps prevent 'undefined' errors
const AuthContext = createContext({
    isAuthenticated: false,
    user: null,
    login: () => {},
    logout: () => {},
});

export default AuthContext;