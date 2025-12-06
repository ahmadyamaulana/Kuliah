/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikumpbo_10;

/**
 *
 * @author Maullovers
 */
public class main {
    public static void main(String[]args) {
        //Objek penjumlahan
        OperasiHitung Penjumlahan = new Penjumlahan ();
        System.out.println("Penjumlahan: " + Penjumlahan.hitung(10,5));
        
        //Objek pengurangan
        OperasiHitung Pengurangan = new Pengurangan ();
        System.out.println("Pengurangan: " + Pengurangan.hitung(10,5));
    }
}
