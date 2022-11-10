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