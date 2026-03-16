# Author : Chiqo Nanda Rial Pratama
# Mini Project 2 - Flutter Mobile Programming
# 📱 Daily Habit Tracker

---

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

### Login

<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/36bdf8fc-fb06-4f0a-a708-ee37f3bd7f54" />

### Registrasi

<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/4e5a4bd0-64ba-4d64-a424-6ec5611a2232" />


2. Light Mode dan Dark Mode

Aplikasi mendukung mode terang dan mode gelap yang dapat diubah langsung dari halaman utama menggunakan tombol toggle.

### LightMode

<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/e36f506c-cfb2-46c9-ac6f-75265fc54a4c" />

### Nightmode

<img width="528" height="1069" alt="image" src="https://github.com/user-attachments/assets/2d3b5c8c-b145-4352-9804-c133c6603093" />


3. Penggunaan File .env

Untuk menjaga keamanan konfigurasi, Supabase URL dan API Key disimpan di dalam file .env sehingga tidak ditampilkan secara langsung di dalam source code.


### File .Env
<img width="1069" height="126" alt="image" src="https://github.com/user-attachments/assets/33b53308-2f49-41ce-ab6d-351d5558bf67" />

### Output 

<img width="730" height="159" alt="image" src="https://github.com/user-attachments/assets/fcb59566-dbca-428b-9ce1-51139869e5ff" />



Contoh isi file .env:

SUPABASE_URL=https://jstcthqrpepyeamjkbid.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzdGN0aHFycGVweWVhbWprYmlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM2NDkxNDAsImV4cCI6MjA4OTIyNTE0MH0.TisvdWMrbQHFIvnsWsDPVVkWvENPeXTveHqLb6fSLxk

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

<img width="360" height="550" alt="image" src="https://github.com/user-attachments/assets/3f65df57-bcea-4ec9-b3e1-0e4f83be8f8c" />

---

## Cara Menjalankan Aplikasi

- Clone repository dari GitHub

- git clone https://github.com/username/repository-name.git

- Masuk ke folder project

- cd project-name

- Install dependencies

- flutter pub get

- Jalankan aplikasi

- flutter run

---









