/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikumpbo_10;

/**
 *
 * @author Maullovers
 */
public class Makanan implements Pembayaran {

    @Override
    public double hitung(double harga) {
        return harga * 0.05;
    }
}
