# Minpro Task 1
# Chiqo Nanda Rial Pratama | 2409116046

# 📱 Daily Habit Tracker

## Deskripsi Aplikasi

Habit Tracker App adalah aplikasi mobile berbasis Flutter yang digunakan untuk membantu pengguna mencatat dan memantau kebiasaan sehari-hari. Aplikasi ini memungkinkan pengguna untuk membuat daftar kebiasaan yang ingin dilakukan secara konsisten setiap hari seperti membaca, olahraga, meditasi, dan aktivitas produktif lainnya.

---

Pada Mini Project 2 ini, aplikasi dikembangkan dengan mengintegrasikan database Supabase sehingga seluruh data kebiasaan disimpan secara online. Selain itu, aplikasi juga menggunakan Supabase Authentication untuk fitur login dan register pengguna.

Dengan aplikasi ini pengguna dapat menambahkan, melihat, mengedit, dan menghapus kebiasaan secara mudah melalui antarmuka yang sederhana dan responsif.

---

## Fitur Aplikasi
Fitur Utama (CRUD Supabase)
- Create

Pengguna dapat menambahkan kebiasaan baru melalui halaman Add Habit. Data yang dimasukkan akan langsung disimpan ke database Supabase.

- Read

Aplikasi menampilkan daftar kebiasaan yang telah dibuat oleh pengguna pada halaman utama. Data diambil langsung dari database Supabase.

- Update

Pengguna dapat mengedit kebiasaan yang telah dibuat melalui halaman Edit Habit.

- Delete

Pengguna dapat menghapus kebiasaan yang tidak diperlukan lagi dari daftar.

---

## Navigasi Halaman

Aplikasi menggunakan multi page navigation yang terdiri dari beberapa halaman utama:

Login Page → halaman untuk login pengguna

Register Page → halaman untuk membuat akun baru

Home Page → menampilkan daftar kebiasaan pengguna

Add Habit Page → halaman untuk menambahkan kebiasaan baru

Edit Habit Page → halaman untuk mengedit atau menghapus kebiasaan

---

## Struktur Data

Setiap data kebiasaan memiliki minimal 3 field input, yaitu:

- Title (Nama Kebiasaan)

- Description (Deskripsi Kebiasaan)

- Category (Kategori Kebiasaan)

- Status Completed (Status selesai atau belum)

- Integrasi Supabase

---

Aplikasi ini menggunakan Supabase sebagai backend untuk:

- Database PostgreSQL

- Authentication (Login & Register)

- Penyimpanan data kebiasaan

- Seluruh data kebiasaan disimpan dalam tabel habits di database Supabase.

---

## Nilai Tambah yang Diimplementasikan
1. Login dan Register (Supabase Auth)

Aplikasi menyediakan fitur autentikasi pengguna menggunakan Supabase Authentication sehingga setiap pengguna hanya dapat melihat dan mengelola data kebiasaan miliknya sendiri.

2. Light Mode dan Dark Mode

Aplikasi mendukung mode terang dan mode gelap yang dapat diubah langsung dari halaman utama menggunakan tombol toggle.

3. Penggunaan File .env

Untuk menjaga keamanan konfigurasi, Supabase URL dan API Key disimpan di dalam file .env sehingga tidak ditampilkan secara langsung di dalam source code.

Contoh isi file .env:

SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key

---

## Widget yang Digunakan

### Aplikasi ini menggunakan berbagai widget Flutter untuk membangun antarmuka pengguna, diantaranya:

- MaterialApp

- Scaffold

- AppBar

- ListView.builder

- Card

- Container

- Text

- TextField

- ElevatedButton

- FloatingActionButton

- Checkbox

- IconButton

- Wrap

- GestureDetector

- Navigator

- LinearProgressIndicator

- SingleChildScrollView

Widget-widget tersebut digunakan untuk membangun layout aplikasi, menampilkan data kebiasaan, membuat form input, serta mengatur navigasi antar halaman.

### Teknologi yang Digunakan

- Flutter

- Dart

- Supabase

- Provider (State Management)

- Flutter Dotenv

---

## Struktur Project
lib
│
├── models
│     habit_model.dart
│
├── pages
│     login_page.dart
│     register_page.dart
│     home_page.dart
│     add_habit_page.dart
│     edit_habit_page.dart
│
├── widgets
│     habit_card.dart
│     progress_section.dart
│
├── services
│     habit_service.dart
│     auth_service.dart
│
├── provider
│     theme_provider.dart
│
└── main.dart

---

Cara Menjalankan Aplikasi

- Clone repository dari GitHub

- git clone https://github.com/username/repository-name.git

- Masuk ke folder project

- cd project-name

- Install dependencies

- flutter pub get

- Jalankan aplikasi

- flutter run

---

## Author : Chiqo Nanda Rial Pratama
## Mini Project 2 - Flutter Mobile Programming
## Habit Tracker App


<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/36bdf8fc-fb06-4f0a-a708-ee37f3bd7f54" />


<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/4e5a4bd0-64ba-4d64-a424-6ec5611a2232" />


<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/e36f506c-cfb2-46c9-ac6f-75265fc54a4c" />


<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/9a618efc-113e-443b-9bdd-8a9ee7c8c0f1" />



