# Catatan Perbaikan Error Flutter

## Diagnosis dari log

Log yang diterima berisi banyak error berantai, misalnya `State`, `Widget`, `BuildContext`, `runApp`, `MaterialApp`, dan `Colors` tidak ditemukan di beberapa file sekaligus. Source yang diperiksa sudah mengimpor `package:flutter/material.dart`, dan `pubspec.yaml` sudah mendeklarasikan Flutter SDK. Pola error ini menunjukkan bahwa Flutter framework atau resolusi dependensinya tidak sedang dipakai dengan benar oleh proses yang mengompilasi file.

## Langkah perbaikan

1. Buka folder `dashboard_live_streaming_flutter` yang langsung berisi `pubspec.yaml`.
2. Pastikan Flutter SDK tersedia dengan menjalankan `flutter doctor`.
3. Jalankan `flutter pub get` agar dependensi dan konfigurasi paket dibuat.
4. Jalankan aplikasi memakai `flutter run` (bukan `dart lib/main.dart` atau menjalankan file Dart satu per satu).
5. Jika menggunakan VS Code, buka folder proyek melalui **File > Open Folder** dan pastikan ekstensi Flutter sudah terpasang.

Di Windows, jalankan `JALANKAN_FLUTTER_WINDOWS.bat` dari folder proyek. Pada macOS/Linux, jalankan `./jalankan_flutter.sh` dari terminal.

## Batas verifikasi

File sumber tidak diubah hanya untuk membungkam error berantai, karena import Flutter yang relevan sudah ada. Build tidak dapat dijalankan di lingkungan penyusunan arsip ini karena executable `flutter` dan `dart` tidak tersedia. Setelah langkah di atas, bila masih ada error, kirim hasil `flutter doctor -v` dan output lengkap `flutter pub get` atau `flutter run`; error yang tersisa bisa didiagnosis secara spesifik.
