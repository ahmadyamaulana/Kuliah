/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tugas6;

/**
 *
 * @author Acer
 */
public class Main {

    public static void main(String[] args) {
        
        Produk buku = new  Buku("Sains untuk anak-anak", 100000);
        Produk hp = new Elektronik("Xiaomi", 2000000);
        Produk baju = new Pakaian("Erigo", 150000);
        
        buku.tambahProduk(buku);
        hp.tambahProduk(hp);
        baju.tambahProduk(baju);
        
        
        System.out.println("Harga Buku Setelah Diskon : " + buku.hitungDiskon());
        System.out.println("Harga Barang Elektronik Setelah Diskon : " + hp.hitungDiskon());
        System.out.println("Harga Baju Setelah Diskon : " + baju.hitungDiskon());
        System.out.println("Total Harga Setelah Diskon : " + Produk.hitungTotal());
    }
}
