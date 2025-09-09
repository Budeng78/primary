<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Auth\Otp;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

class OtpController extends Controller
{
    /**
     * Membuat atau menemukan pengguna, lalu mengirim kode OTP.
     */
    public function sendOtp(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'whatsapp_number' => 'required|string|regex:/^08[0-9]{8,12}$/|min:10|max:15',
        ]);
        
        try {
            // Logika "temukan atau buat". Jika pengguna sudah ada, ia akan ditemukan.
            // Jika tidak, pengguna baru akan dibuat.
            // Kami menyediakan email placeholder agar kolom 'email' diisi,
            // sehingga tetap kompatibel dengan login berbasis email di masa mendatang.
            $user = User::firstOrCreate(
                ['whatsapp_number' => $request->whatsapp_number],
                [
                    'name' => $request->name,
                    'email' => Str::random(10) . '@example.com', 
                    'password' => Hash::make(Str::random(10))
                ]
            );
            
            // Hapus OTP lama yang mungkin ada untuk nomor ini
            Otp::where('whatsapp_number', $request->whatsapp_number)->delete();

            // Buat kode OTP acak
            $otpCode = rand(100000, 999999);
            
            // Simpan OTP baru di database
            Otp::create([
                'name' => $user->name,
                'whatsapp_number' => $request->whatsapp_number,
                'otp_code' => $otpCode,
                'expires_at' => Carbon::now()->addMinutes(5),
            ]);
            
            // Kirim OTP via API WhatsApp Gateway
            try {
                $response = Http::post('http://192.168.3.253:1880/api/otp', [
                    'to' => $request->whatsapp_number,
                    'message' => "Halo {$user->name}! Kode OTP Anda adalah: {$otpCode}. Kode akan kedaluwarsa dalam 5 menit."
                ]);

                Log::info('Node-RED Response Status: ' . $response->status());
                Log::info('Node-RED Response Body: ' . $response->body());

                if ($response->successful()) {
                    return response()->json(['message' => 'Kode OTP berhasil dikirim.'], 200);
                } else {
                    Log::error('Gagal mengirim OTP ke Node-RED. Status: ' . $response->status() . ' Body: ' . $response->body());
                    return response()->json(['message' => 'Gagal mengirim OTP. Server Node-RED tidak merespons dengan benar.'], 500);
                }
            } catch (\Exception $httpException) {
                Log::error('Koneksi ke Node-RED gagal: ' . $httpException->getMessage());
                return response()->json(['message' => 'Gagal mengirim OTP. Pastikan server Node-RED berjalan.'], 500);
            }

        } catch (\Exception $e) {
            Log::error('Kesalahan umum saat mengirim OTP: ' . $e->getMessage());
            return response()->json(['message' => 'Gagal mengirim OTP. Coba lagi.'], 500);
        }
    }

    /**
     * Memverifikasi kode OTP dan mengautentikasi pengguna.
     */
    public function verifyOtp(Request $request)
    {
        $request->validate([
            'whatsapp_number' => 'required|string',
            'otp_code' => 'required|string|size:6'
        ]);
        
        $otp = Otp::where('whatsapp_number', $request->whatsapp_number)
                  ->where('otp_code', $request->otp_code)
                  ->first();
        
        if (!$otp || Carbon::now()->greaterThan($otp->expires_at)) {
            return response()->json(['message' => 'Kode OTP salah atau sudah kedaluwarsa.'], 401);
        }
        
        $otp->delete();
        
        $user = User::where('whatsapp_number', $request->whatsapp_number)->first();
        
        if ($user) {
            Auth::login($user);
            // Setelah login, Anda dapat mengembalikan user object untuk digunakan di frontend
            return response()->json([
                'message' => 'Verifikasi berhasil. Anda telah login!',
                'user' => $user
            ], 200);
        }

        return response()->json(['message' => 'Terjadi kesalahan saat login.'], 500);
    }
}
