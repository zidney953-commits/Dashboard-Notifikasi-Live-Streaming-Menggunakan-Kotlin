#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"

if ! command -v flutter >/dev/null 2>&1; then
  echo "ERROR: perintah flutter tidak ditemukan. Instal Flutter SDK dan tambahkan flutter/bin ke PATH." >&2
  echo "Panduan: https://docs.flutter.dev/get-started/install" >&2
  exit 1
fi

flutter doctor
flutter pub get
flutter devices
flutter run
