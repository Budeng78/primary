//resources\js\aplikasi\utils\axios.js import axios from "axios";

axios.defaults.baseURL = "http://192.168.3.253:81"; // sesuaikan dengan URL Laravel-mu 
axios.defaults.withCredentials = true;

export default axios;