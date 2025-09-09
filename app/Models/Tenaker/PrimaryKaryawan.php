<?php

namespace App\Models\Tenaker;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrimaryKaryawan extends Model
{
    use HasFactory;

    protected $table = 'primary_karyawan';
    protected $primaryKey = 'no_id';
    public $timestamps = false;
    public $incrementing = true;
    protected $keyType = 'int';

    protected $fillable = [
        'no_induk_absen',
        'nama',
        'status_upah',
        'status_karyawan',
        'masuk_kerja',
        'masa_kerja',
        'ditetapkan',
        'bagian',
        'sub_bagian',
        'kelompok_kerja',
        'pekerjaan',
        'alamat_rt_rw',
        'alamat_desa',
        'alamat_kecamatan',
        'alamat_kabupaten',
        'no_nik',
        'no_kk',
        'kelamin',
        'tempat_lahir',
        'tanggal_lahir',
        'umur',
        'pendidikan',
        'disabilitas',
        'kpi',
        'no_bpjs_kes',
        'no_kpj',
        'no_hp',
        'whatsapp_number',
        'email',
        'bank',
        'no_bank',
        'vaksin',
        'riwayat_kesehatan',
        'foto_profile',
        'foto_formal',
    ];

    protected $casts = [
        'masuk_kerja'   => 'date',
        'ditetapkan'    => 'date',
        'tanggal_lahir' => 'date',
    ];

    protected $appends = [
        'foto_profile_url',
        'foto_formal_url',
    ];

    protected $hidden = [
        'foto_profile',
        'foto_formal',
    ];

    public function getFotoProfileUrlAttribute()
    {
        return $this->foto_profile 
            ? asset('storage/' . $this->foto_profile) 
            : null;
    }

    public function getFotoFormalUrlAttribute()
    {
        return $this->foto_formal 
            ? asset('storage/' . $this->foto_formal) 
            : null;
    }
}
