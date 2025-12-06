/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikum11;

/**
 *
 * @author Maullovers
 */
public class main2 {
    public static void main(String[] args) {

        // Membuat pengarang (AGREGASI → berdiri sendiri)
        Pengarang p1 = new Pengarang("Tere Liye");
        Pengarang p2 = new Pengarang("Andrea Hirata");

        // Membuat perpustakaan (KOMPOSISI → Buku dimiliki Perpustakaan)
        Perpustakaan perpustakaan = new Perpustakaan(5);

        // Membuat buku (Buku terhubung ke Pengarang melalui agregasi)
        Buku b1 = new Buku("Hujan", p1);
        Buku b2 = new Buku("Laskar Pelangi", p2);

        // Memasukkan buku ke dalam perpustakaan
        perpustakaan.tambahBuku(b1);
        perpustakaan.tambahBuku(b2);

        // Menampilkan isi perpustakaan
        perpustakaan.tampilkanBuku();
    }
}
