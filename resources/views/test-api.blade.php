<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Test</title>
</head>
<body>
    <h1>Testing Tenaker API</h1>
    <pre id="api-response"></pre>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const apiResponseElement = document.getElementById('api-response');
            
            // Ganti URL ini jika server API Anda berbeda
            const apiUrl = 'http://192.168.3.253:81/api/tenaker';

            fetch(apiUrl)
                .then(response => {
                    // Cek apakah response berhasil (status 200 OK)
                    if (!response.ok) {
                        throw new Error('Network response was not ok: ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    apiResponseElement.textContent = JSON.stringify(data, null, 2);
                })
                .catch(error => {
                    apiResponseElement.textContent = 'Gagal mengambil data: ' + error.message;
                    console.error('There was a problem with the fetch operation:', error);
                });
        });
    </script>
</body>
</html>