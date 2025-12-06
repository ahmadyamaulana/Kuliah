/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikumpbo_10;

/**
 *
 * @author Maullovers
 */
public class main2 {
    public static void main(String[] args) {

        Pembayaran elektronik = new Elektronik();
        double hargaelektronik = 15000000;  // harga elektronik

        double pajakElektronik = elektronik.hitung(hargaelektronik);
        double totalElektronik = hargaelektronik + pajakElektronik;

        System.out.println("Harga Elektronik : " + hargaelektronik);
        System.out.println("Pajak Elektronik : " + pajakElektronik);
        System.out.println("Total Harga Setelah Pajak : " + totalElektronik);
        
        Pembayaran makanan = new Makanan();
        double hargamakanan = 20000;  // harga makanan

        double pajakMakanan = makanan.hitung(hargamakanan);
        double totalMakanan = hargamakanan + pajakMakanan;

        System.out.println("Harga Elektronik : " + hargamakanan);
        System.out.println("Pajak Elektronik : " + pajakMakanan);
        System.out.println("Total Harga Setelah Pajak : " + totalMakanan);
        
    }
}
