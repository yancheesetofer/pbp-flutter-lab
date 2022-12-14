# Assignment 7 PBP
### Yan Christofer S.
### 2106752464
### PBP C 

## Stateless Widget dan Stateful Widget, serta Perbedaan dari Keduanya
**_Stateless Widget_**, dan **_Stateful Widget_**.
1. **_Stateless Widget_** adalah sebuah _widget_ yang state-nya tidak bisa diubah-ubah gugat setelah dibangun. widget ini immutable ketika mereka dibangun dalam kata lain perubahan apapun pada variabel, icon, tombol, atau pengambilan data tidak akan mengubah state app-nya. Contoh sederhananya adalah `Text`.
2. **_Stateful Widget_** adalah sebuah _widget_ yang state-nya bisa diubah setelah dibangun. State dari _widget_ ini mutable dan bisa diubah berkali-kali. Contoh sederhananya adalah `Form`. <br />

Perbedaan
**_Stateless Widget_**
1. Static
2. Hal ini tidak bergantung pada perubahan data atau perubahan _behavior_ apapun
3. Tidak memiliki state, akan di _render_ sekali dan tidak akan di-_update_ sendiri, tetapi hanya akan diperbarui saat data eksternalnya berubah <br />
Contohnya: `Text`. 

**_Stateful Widget_**
1. Dynamic
2. Dilakukan _update_ selama _runtime_ berdasarkan _action_ atau perubahan data yang dilakukan oleh _user_
3. Memiliki _internal state_ dan dapat dilakukan _re-render_ jika input data nya berubah atau saat _state_ dari _widget_ berubah <br />
Contohnya: `Form` 

## Widget Apa Saja yang Dipakai pada Proyek Kali Ini Beserta Fungsinya
AppBar: Membuat toolbar.
Text: menampilkan text.
Center: membuat child menjadi centered
Column: Layout child vertikal.
Row: Layout child horizontal.

## Fungsi dari `setState()` dan Variabel yang Terdampak
Fungsi `setState()` adalah mengubah data dan menampilkannya per state (widget dan turunannya direbuild)
## Perbedaan antara `const` dengan `final`
const untuk variable yang konstan sejak saat compile time, sedangkan final untuk variable dengan value yang tidak dapat diubah sama sekali

## Implementasi
### Membuat app Flutter bernama counter_7
Tentunya, harus diawali dahulu dengan melakukan `flutter create counter_7` pada bash folder yang dituju untuk memulai proyek ini.
### Membuat fungsi untuk button decrement
### Membuat fungsi menentukan jenis bilangan ganjil dan genap
### Melakukan fungsi display untuk widget

# Assignment 8 PBP

`flutter run --no-sound-null-safety` to run the app due to intl package

## Perbedaan **Navigator.push** dan **Navigator.pushReplacemenet**
_Navigator.push_ akan menavigasi app dengan menambahkan rute ke stack
_Navigator.pushReplacement_ akan menavigasi app dengan menggantikan rute yang ada pada top stack

## Widget yang digunakan

Drawer untuk navigasi antar page
ListView menampilkan children dengan scroll
SizedBox membuat box dengan specified size
ShowDatePicker untuk date picker dialog
Form untuk membuat container form field

## Jenis-jenis event pada flutter

onTap dan onPressed mengcapture event ketika tombol ditekan (onTap untuk tiap gesture)

onChange ketika ada value yang dirubah

onHover ketika mouse pointer bergerak di atas tombol

onSave mengcapture event ketika terjadi event "save"

## Cara kerja Navigator dalam mengganti halaman dari aplikasi flutter

Navigation di flutter menerapkan stack.
Seperti yang dijelaskan pada poin sebelumnya, 
push akan menambahkan screen baru ke top of stack (halaman sekarang) dan pop akan membuat user menavigasi ke halaman sebelumnya (remove current screen)

## Implementasi checklists

### Buat drawer untuk navigasi
### Navigator.pushReplacement untuk 3 menu yang ada
### Buat halaman form, khusus pemasukan dan pengeluaran kita buat dropdown
### Data.dart dibuat untuk menyimpan data budget yang sudah dibuat
### Konfigurasi keempat file .dart agar saling sinkron

# Assignment 8 PBP
`flutter run --no-sound-null-safety` to run the app due to intl package

##  Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman mywatchlist.
### Tambah drawer navigasi ke halaman baru yaitu mywatchlistpage

## Membuat satu file dart yang berisi model mywatchlist.
### Convert data json dari https://tugasmvt.herokuapp.com/mywatchlist/json/ ke dart menggunakan quicktype
### simpan ke file myWatchlist.dart

## Menambahkan halaman mywatchlist yang berisi semua watch list yang ada pada endpoint JSON di Django yang telah kamu deploy ke Heroku sebelumnya (Tugas 3). Pada bagian ini, kamu cukup menampilkan judul dari setiap mywatchlist yang ada.
### Buat navigasi dari judul ke halaman detail
### class Movie sebagai halaman detail
### Buat rute navigasi untuk kembali ke mywatchlistpage

