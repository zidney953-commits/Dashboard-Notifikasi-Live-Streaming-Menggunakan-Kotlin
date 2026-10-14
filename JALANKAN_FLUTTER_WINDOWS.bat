@echo off
setlocal
cd /d "%~dp0"

where flutter >nul 2>nul
if errorlevel 1 (
  echo ERROR: Perintah flutter tidak ditemukan.
  echo Instal Flutter SDK, tambahkan folder flutter\bin ke PATH, lalu buka terminal baru.
  echo Panduan: https://docs.flutter.dev/get-started/install
  pause
  exit /b 1
)

echo === Memeriksa instalasi Flutter ===
call flutter doctor

echo.
echo === Mengambil dependensi proyek ===
call flutter pub get
if errorlevel 1 (
  echo GAGAL: flutter pub get. Periksa versi Flutter dan koneksi internet.
  pause
  exit /b 1
)

echo.
echo === Perangkat yang tersedia ===
call flutter devices

echo.
echo === Menjalankan aplikasi ===
call flutter run
set "RESULT=%ERRORLEVEL%"
pause
exit /b %RESULT%
