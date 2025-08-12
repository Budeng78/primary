import React from 'react';
import { useNavigate } from 'react-router-dom';
import NotFoundModal from '@/aplikasi/components/modal/NotFoundModal';
import DefaultLayout from '@/aplikasi/layouts/DefaultLayout';

const NotFoundModal = () => {
    const navigate = useNavigate();

    return (
        <DefaultLayout>
            <NotFoundModal onClose={() => navigate('/')} />
        </DefaultLayout>
    );
};

export default NotFoundModal;