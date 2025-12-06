/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikum3;

/**
 *
 * @author Maullovers
 */
public class Main {
    public static void main(String[] args) {
        Mobil mobil1 = new Mobil("Inova", "Kijang", 2019, "Putih");
        Mobil mobil2 = new Mobil("Avanza", "Veloz", 2020, "Hitam");

        mobil1.info();
        mobil1.startEngine();

        mobil2.info();
        mobil2.startEngine();

    }
}
