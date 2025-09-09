<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Laravel\Facades\Image;


Route::get('/', function () {
    return view('app');
});
Route::get('/img', function (Request $request) {
    $upload = $request->file('image');
    $image = Image::read($upload)
        ->resize(300, 200);
    Storage::put(
        Str::random() . '.' . $upload->getClientOriginalExtension(),
        $image->encodeByExtension($upload->getClientOriginalExtension(), quality: 70)
    );
});


Route::get('/image-upload', function () {
    return view('image-upload');
});

Route::get('/test-api', function () {
    return view('test-api');
});

Route::post('/upload', [App\Http\Controllers\Images\ImageController::class, 'store'])->name('upload');

Route::get('/{any?}', function () {
    return view('app');
})->where('any', '.*');

Route::get('/posisi', function () {
    return view('posisi');
    });