/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikum5;

/**
 *
 * @author Maullovers
 */
public class Main {
    
    public static void main(String[] args){
        Mobil mobil = new Mobil();
        mobil.nama = "Mcleren";
        mobil.kecepatan = 320;
        mobil.jumlahPintu = 2;
        mobil.jumlahRoda = 4;
        
        mobil.tampilkaninfo();
        
        SepedaMotor motor = new SepedaMotor();
        motor.nama = "bebek";
        motor.kecepatan = 280;
        motor.jenisMesin = "Ducati";
        motor.jumlahRoda = 2;
        
        motor.tampilkaninfo();
        
        Anjing anjing1 = new Anjing();
        anjing1.nama = "yanto";
        anjing1.jenis = "ceper dikit";
        
        anjing1.infoHewan();
        
        Kucing kucing1 = new Kucing();
        kucing1.nama = "ilham";
        kucing1.jenis = "galak tapi setia";
        
        kucing1.infoHewan();
    }
}
