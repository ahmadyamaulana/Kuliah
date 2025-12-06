/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tugas6;
import java.util.ArrayList;
/**
 *
 * @author Acer
 */
abstract class Produk {
    String nama;
    double harga;
    
    private static ArrayList<Produk> keranjang = new ArrayList<>();
    
    public Produk(String nama, double harga) {
        this.nama = nama;
        this.harga = harga;
    }
    
    public abstract double hitungDiskon();
    
    public void tambahProduk(Produk p) {
        keranjang.add(p);
    }
    
    public static double hitungTotal() {
        double total = 0;
        for (Produk p : keranjang) {
            total += p.hitungDiskon();
        }
        return total;
    }
}

class Buku extends Produk {
    public Buku(String nama, double harga) {
        super(nama, harga);
    } 
    
    @Override
    public double hitungDiskon() {
        return harga * 0.9;
    }
}

class Elektronik extends Produk {
    
    public Elektronik(String nama, double harga) {
        super(nama, harga);
    }
    
    @Override
    public double hitungDiskon() {
        return harga * 0.65;
    }
}

class Pakaian extends Produk {
    public Pakaian(String nama, double harga) {
        super(nama, harga);
    }
    
    @Override
    public double hitungDiskon() {
        return harga * 0.8;
    }
}
