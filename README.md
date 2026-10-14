# Dashboard Notifikasi Live Streaming - Flutter

Prototype aplikasi untuk tugas **Perancangan dan Pengembangan Aplikasi Dashboard Notifikasi Live Streaming Berbasis Flutter**.

## Fitur prototype
- Dashboard status live streaming
- Jumlah penonton
- Waktu mulai live
- Daftar notifikasi
- Tandai notifikasi sebagai dibaca
- Detail live streaming
- Pengaturan notifikasi
- Simulasi notifikasi masuk tanpa Firebase

## Menjalankan di VS Code
1. Pastikan Flutter SDK sudah terpasang.
2. Buka folder project ini di VS Code.
3. Jalankan `flutter doctor`.
4. Jalankan `flutter pub get`.
5. Pilih device/emulator.
6. Jalankan `flutter run` atau tekan F5.

## Tahap berikutnya
Tambahkan Firebase Cloud Messaging (FCM) untuk notifikasi push nyata dan backend/API untuk mengambil status live streaming secara real-time.


## Jika muncul error `Widget`, `State`, `BuildContext`, atau `runApp` tidak ditemukan

Error tersebut biasanya muncul ketika file Flutter dijalankan menggunakan tool Dart biasa, atau dependensi Flutter belum disiapkan. Jalankan perintah berikut dari folder proyek yang berisi `pubspec.yaml`:

```bash
flutter doctor
flutter pub get
flutter run
```

Jangan jalankan `dart lib/main.dart` untuk menjalankan aplikasi ini. Pastikan folder yang dibuka di VS Code adalah folder proyek ini (folder yang langsung berisi `pubspec.yaml`), bukan folder `lib` atau folder induknya.

Di VS Code, pasang ekstensi Flutter (ekstensi Dart akan ikut digunakan), buka folder proyek melalui **File > Open Folder**, lalu jalankan perintah di atas pada terminal bawaan VS Code. Jika `flutter` tidak dikenali, instal Flutter SDK dan tambahkan folder `flutter/bin` ke `PATH`.

Untuk Windows, file `JALANKAN_FLUTTER_WINDOWS.bat` dapat digunakan untuk mengambil dependensi dan menjalankan aplikasi.
