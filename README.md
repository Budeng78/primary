download folder dan letakkan di [project laravel]\resources\
jalankan npm run build
npm install framer-motion




//resources\js\aplikasi\utils\axios.js
import axios from "axios";

axios.defaults.baseURL = "http://192.168.1.102:81"; // sesuaikan dengan URL Laravel-mu
axios.defaults.withCredentials = true;

export default axios;
