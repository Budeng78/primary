<?php
//routes\api.php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\ApiAuthController;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Personalia\TenakerController; 
use App\Http\Controllers\Auth\OtpController;
use App\Http\Controllers\Images\ImageController;



Route::post('/log-404', function (Request $request) {
    Log::warning('404 Not Found', [
        'path' => $request->input('path'),
        'timestamp' => $request->input('timestamp'),
        'userAgent' => $request->input('userAgent'),
    ]);

    return response()->json(['status' => 'logged']);
});


// Public routes
Route::post('/register', [ApiAuthController::class, 'register']);
Route::post('/login', [ApiAuthController::class, 'login']);


// Rute khusus untuk login OTP
Route::post('/otp/send', [OtpController::class, 'sendOtp'])->middleware('throttle:3,1'); // <-- Rute untuk mengirim OTP
Route::post('/otp/verify', [OtpController::class, 'verifyOtp']); // <-- Rute untuk memverifikasi OTP
Route::get('/karyawan/rekap-subbagian', [TenakerController::class, 'rekapSubbagian']);
Route::get('/test-karyawan', function () {
        $karyawan = PrimaryKaryawan::first();
        return response()->json($karyawan);
    });



// Protected routes auth:sanctum
Route::middleware('dual-auth')->group(function () {
    Route::get('/user', [ApiAuthController::class, 'user']);
    Route::post('/logout', [ApiAuthController::class, 'logout']);
    
    //group karyawan
    Route::get('/karyawan/{id}', [TenakerController::class, 'show']);
    Route::get('/karyawan', [TenakerController::class, 'index']);
    Route::put('/karyawan/{id}', [TenakerController::class, 'update']);
    Route::post('/karyawan', [TenakerController::class, 'store']);
    Route::delete('/karyawan/{id}', [TenakerController::class, 'destroy']);
    Route::post('/karyawan/upload-profile-photo', [ImageController::class, 'uploadFotoProfile']);
    Route::post('/karyawan/upload-formal-photo', [ImageController::class, 'uploadFormalPhoto']);
    

    
   

}); 