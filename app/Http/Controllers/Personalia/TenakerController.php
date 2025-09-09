<?php
// app/Http/Controllers/Personalia/TenakerController.php

namespace App\Http\Controllers\Personalia;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Models\Tenaker\PrimaryKaryawan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Laravel\Facades\Image;


class TenakerController extends Controller
{
    /**
     * Ambil semua data karyawan.
     */
    public function index()
    {
        $list = PrimaryKaryawan::all();
        return response()->json($list);
    }

    /**
     * Tampilkan detail karyawan berdasarkan no_id.
     */
   public function show($id)
        {
            $employee = PrimaryKaryawan::findOrFail($id);

            return response()->json([
                ...$employee->toArray(),
                'foto_profile' => $employee->foto_profile 
                    ? asset('storage/'.$employee->foto_profile) 
                    : null,
                'foto_formal' => $employee->foto_formal 
                    ? asset('storage/'.$employee->foto_formal) 
                    : null,
            ]);
        }
    /**
     * Tambah data karyawan baru.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'no_induk_absen' => 'required|string|max:255|unique:primary_karyawan',
            'nama' => 'required|string|max:255',
            'status_upah' => 'required|string|max:255',
            'status_karyawan' => 'required|string|max:255',
            'masuk_kerja' => 'required|date',
            'masa_kerja' => 'required|string|max:255',
            'ditetapkan' => 'required|date',
            'bagian' => 'required|string|max:255',
            'sub_bagian' => 'required|string|max:255',
            'kelompok_kerja' => 'required|string|max:255',
            'pekerjaan' => 'required|string|max:255',
            'alamat_rt_rw' => 'required|string|max:255',
            'alamat_desa' => 'required|string|max:255',
            'alamat_kecamatan' => 'required|string|max:255',
            'alamat_kabupaten' => 'required|string|max:255',
            'no_nik' => 'required|string|max:255|unique:primary_karyawan',
            'no_kk' => 'required|string|max:255|unique:primary_karyawan',
            'kelamin' => 'required|string|max:255',
            'tempat_lahir' => 'required|string|max:255',
            'tanggal_lahir' => 'required|date',
            'umur' => 'required|integer',
            'pendidikan' => 'required|string|max:255',
            'disabilitas' => 'required|string|max:255',
            'kpi' => 'required|string|max:255',
            'no_bpjs_kes' => 'required|string|max:255|unique:primary_karyawan',
            'no_kpj' => 'required|string|max:255|unique:primary_karyawan',
            'no_hp' => 'required|string|max:255|unique:primary_karyawan',
            'email' => 'required|email|max:255|unique:primary_karyawan',
            'bank' => 'required|string|max:255',
            'no_bank' => 'required|string|max:255|unique:primary_karyawan',
            'vaksin' => 'required|string|max:255',
            'riwayat_kesehatan' => 'required|string',
            'foto_profile' => 'sometimes|nullable|string|max:255',
            'foto_formal'  => 'sometimes|nullable|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            $data = $request->all();

            if ($request->hasFile('foto_profile')) {
                $file = $request->file('foto_profile');
                $namaFile = time().'_'.Str::slug($request->input('nama')).'.'.$file->extension();
                $path = $file->storeAs('karyawan/foto_profile', $namaFile, 'public');
                $data['foto_profile'] = $path;
            }

            if ($request->hasFile('foto_formal')) {
                $file = $request->file('foto_formal');
                $namaFile = time().'_'.Str::slug($request->input('nama')).'.'.$file->extension();
                $path = $file->storeAs('karyawan/foto_formal', $namaFile, 'public');
                $data['foto_formal'] = $path;
            }

            $karyawan = PrimaryKaryawan::create($data);

            return response()->json([
                'message' => 'Data karyawan berhasil ditambahkan.',
                'data' => $karyawan
            ], 201);

        } catch (\Exception $e) {
            return response()->json(['message' => 'Gagal menambahkan data karyawan.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Hapus data karyawan.
     */
    public function destroy($id)
    {
        try {
            $karyawan = PrimaryKaryawan::where('no_id', $id)->first();

            if (!$karyawan) {
                return response()->json(['message' => 'Data karyawan tidak ditemukan.'], 404);
            }

            if ($karyawan->foto_profile) Storage::disk('public')->delete($karyawan->foto_profile);
            if ($karyawan->foto_formal) Storage::disk('public')->delete($karyawan->foto_formal);

            $karyawan->delete();

            return response()->json(['message' => 'Data karyawan berhasil dihapus.'], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => 'Gagal menghapus data karyawan.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Rekap berdasarkan sub_bagian, kelompok_kerja, dan kelamin.
     */
    public function rekapSubbagian()
    {
        $data = DB::table('primary_karyawan')
            ->select(
                DB::raw("COALESCE(sub_bagian, 'Tidak Diketahui') as sub_bagian"),
                DB::raw("COALESCE(kelompok_kerja, 'Tidak Diketahui') as kelompok_kerja"),
                DB::raw("COALESCE(kelamin, 'Tidak Diketahui') as kelamin"),
                DB::raw('COUNT(*) as jumlah')
            )
            ->groupBy('sub_bagian', 'kelompok_kerja', 'kelamin')
            ->get();

        if ($data->isEmpty()) {
            return response()->json(['message' => 'Data tenaga kerja tidak ditemukan.'], 404);
        }

        $rekap = collect($data)->groupBy('sub_bagian')->map(function ($group) {
            return [
                'sub_bagian' => $group->first()->sub_bagian,
                'kelompok_kerja' => $group->groupBy('kelompok_kerja')->map(function ($kelompok) {
                    return [
                        'nama' => $kelompok->first()->kelompok_kerja,
                        'laki_laki' => (int) $kelompok->where('kelamin', 'Laki-laki')->sum('jumlah'),
                        'perempuan' => (int) $kelompok->where('kelamin', 'Perempuan')->sum('jumlah'),
                        'lainnya' => (int) $kelompok->whereNotIn('kelamin', ['Laki-laki', 'Perempuan'])->sum('jumlah'),
                    ];
                })->values(),
            ];
        })->values();

        return response()->json($rekap);
    }

    /**
     * Update data karyawan.
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'no_induk_absen' => 'sometimes|nullable|string|max:255',
            'nama' => 'sometimes|nullable|string|max:255',
            'status_upah' => 'sometimes|nullable|string|max:255',
            'status_karyawan' => 'sometimes|nullable|string|max:255',
            'masuk_kerja' => 'sometimes|nullable|date',
            'masa_kerja' => 'sometimes|nullable|string|max:255',
            'ditetapkan' => 'sometimes|nullable|date',
            'bagian' => 'sometimes|nullable|string|max:255',
            'sub_bagian' => 'sometimes|nullable|string|max:255',
            'kelompok_kerja' => 'sometimes|nullable|string|max:255',
            'pekerjaan' => 'sometimes|nullable|string|max:255',
            'alamat_rt_rw' => 'sometimes|nullable|string|max:255',
            'alamat_desa' => 'sometimes|nullable|string|max:255',
            'alamat_kecamatan' => 'sometimes|nullable|string|max:255',
            'alamat_kabupaten' => 'sometimes|nullable|string|max:255',
            'no_nik' => 'sometimes|nullable|string|max:255|unique:primary_karyawan,no_nik,'.$id.',no_id',
            'no_kk' => 'sometimes|nullable|string|max:255|unique:primary_karyawan,no_kk,'.$id.',no_id',
            'kelamin' => 'sometimes|nullable|string|max:255',
            'tempat_lahir' => 'sometimes|nullable|string|max:255',
            'tanggal_lahir' => 'sometimes|nullable|date',
            'umur' => 'sometimes|nullable|integer',
            'pendidikan' => 'sometimes|nullable|string|max:255',
            'disabilitas' => 'sometimes|nullable|string|max:255',
            'kpi' => 'sometimes|nullable|string|max:255',
            'no_bpjs_kes' => 'sometimes|nullable|string|max:255|unique:primary_karyawan,no_bpjs_kes,'.$id.',no_id',
            'no_kpj' => 'sometimes|nullable|string|max:255|unique:primary_karyawan,no_kpj,'.$id.',no_id',
            'no_hp' => 'sometimes|nullable|string|max:255|unique:primary_karyawan,no_hp,'.$id.',no_id',
            'email' => 'sometimes|nullable|email|max:255|unique:primary_karyawan,email,'.$id.',no_id',
            'bank' => 'sometimes|nullable|string|max:255',
            'no_bank' => 'sometimes|nullable|string|max:255|unique:primary_karyawan,no_bank,'.$id.',no_id',
            'vaksin' => 'sometimes|nullable|string|max:255',
            'riwayat_kesehatan' => 'sometimes|nullable|string',
            'foto_profile' => 'sometimes|nullable|string|max:255',
            'foto_formal'  => 'sometimes|nullable|string|max:255',
        ]);
        // 🚫 jangan update foto kalau tidak ada perubahan
        if (!$request->has('foto_profile')) {
            unset($employee->foto_profile);
        }
        if (!$request->has('foto_formal')) {
            unset($employee->foto_formal);
        }

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            $karyawan = PrimaryKaryawan::where('no_id', $id)->first();

            if (!$karyawan) {
                return response()->json(['message' => 'Data karyawan tidak ditemukan.'], 404);
            }

            $data = $request->all();

            $karyawan->update($data);

            return response()->json([
                'message' => 'Data karyawan berhasil diperbarui.',
                'data' => $karyawan
            ], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => 'Gagal memperbarui data karyawan.', 'error' => $e->getMessage()], 500);
        }
    }
}
