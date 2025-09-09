<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uji API Upload Foto</title>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; background-color: #f3f4f6; color: #333; }
        .container { background-color: #fff; padding: 2rem; border-radius: 1rem; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); text-align: center; width: 90%; max-width: 600px; }
        h1 { margin-bottom: 1.5rem; font-size: 1.75rem; font-weight: bold; }
        .form-group { margin-bottom: 1rem; text-align: left; }
        label { display: block; margin-bottom: 0.5rem; font-weight: 600; }
        input[type="file"] { width: 100%; padding: 0.75rem; border: 1px solid #d1d5db; border-radius: 0.5rem; }
        button { padding: 0.75rem 1.5rem; border: none; border-radius: 0.5rem; font-weight: 600; cursor: pointer; transition: background-color 0.2s; }
        .profile-form button { background-color: #2563eb; color: white; }
        .profile-form button:hover { background-color: #1d4ed8; }
        .formal-form button { background-color: #10b981; color: white; }
        .formal-form button:hover { background-color: #059669; }
        .message { margin-top: 1.5rem; padding: 1rem; border-radius: 0.5rem; font-weight: bold; }
        .success { background-color: #d1fae5; color: #065f46; border: 1px solid #6ee7b7; }
        .error { background-color: #fee2e2; color: #991b1b; border: 1px solid #fca5a5; }
        hr { margin: 2rem 0; border: none; border-top: 1px solid #e5e7eb; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Uji API Unggah Foto</h1>
        <p>Unggah foto untuk menguji dua rute API terpisah.</p>

        <!-- Formulir untuk rute tesFotoProfile -->
        <form id="profileForm" class="profile-form">
            <h2>Foto Profil</h2>
            <div class="form-group">
                <label for="profileFile">Pilih Foto Profil</label>
                <input type="file" id="profileFile" name="foto_profile" accept="image/*" required>
            </div>
            <button type="submit" id="submitProfile">Unggah Foto Profil</button>
        </form>

        <div class="message-container" id="profileMessage"></div>

        <hr>

        <!-- Formulir untuk rute tesFormalPhoto -->
        <form id="formalForm" class="formal-form">
            <h2>Foto Formal</h2>
            <div class="form-group">
                <label for="formalFile">Pilih Foto Formal</label>
                <input type="file" id="formalFile" name="foto_formal" accept="image/*" required>
            </div>
            <button type="submit" id="submitFormal">Unggah Foto Formal</button>
        </form>

        <div class="message-container" id="formalMessage"></div>
    </div>

    <script>
        // Catatan: Kedua rute ini tidak lagi memerlukan token otentikasi karena berada di luar middleware 'dual-auth'.
        // Variabel authToken di bawah ini tidak lagi digunakan, tetapi tetap ada untuk referensi.
        const authToken = 'YOUR_AUTH_TOKEN_HERE';

        const setupForm = (formId, endpoint, fileKey, messageId, buttonText) => {
            const form = document.getElementById(formId);
            const fileInput = form.querySelector('input[type="file"]');
            const button = form.querySelector('button[type="submit"]');
            const messageContainer = document.getElementById(messageId);

            const showMessage = (msg, type) => {
                messageContainer.innerHTML = `<div class="message ${type}">${msg}</div>`;
            };

            form.addEventListener('submit', async (e) => {
                e.preventDefault();

                if (fileInput.files.length === 0) {
                    showMessage('Pilih file terlebih dahulu!', 'error');
                    return;
                }

                const formData = new FormData();
                formData.append(fileKey, fileInput.files[0]);

                button.disabled = true;
                button.textContent = 'Mengunggah...';

                try {
                    const response = await fetch(`/api/${endpoint}`, {
                        method: 'POST',
                        body: formData,
                        // Header 'Authorization' dihapus karena rute tidak lagi memerlukan token
                        // headers: {
                        //     'Authorization': `Bearer ${authToken}`,
                        // },
                    });

                    const data = await response.json();

                    if (response.ok) {
                        showMessage(`Berhasil diunggah! Path: ${data.path}`, 'success');
                    } else {
                        const errorMessages = data.errors ? Object.values(data.errors).flat().join('<br>') : (data.message || 'Terjadi kesalahan pada server.');
                        showMessage(`Gagal mengunggah. Pesan: ${errorMessages}`, 'error');
                    }
                } catch (error) {
                    console.error('Terjadi kesalahan:', error);
                    showMessage('Terjadi kesalahan jaringan. Periksa konsol.', 'error');
                } finally {
                    button.disabled = false;
                    button.textContent = buttonText;
                }
            });
        };

        // Atur formulir untuk rute tesFotoProfile
        setupForm('profileForm', 'upload-profile-photo', 'foto_profile', 'profileMessage', 'Unggah Foto Profil');

        // Atur formulir untuk rute tesFormalPhoto
        setupForm('formalForm', 'upload-formal-photo', 'foto_formal', 'formalMessage', 'Unggah Foto Formal');
    </script>
</body>
</html>
