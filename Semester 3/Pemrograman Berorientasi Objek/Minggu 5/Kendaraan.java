/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikum5;

/**
 *
 * @author Maullovers
 */
public class Kendaraan {
    String nama;
    int kecepatan;
    
    public void tampilkaninfo(){
        System.out.println("Nama Kendaraan:" + nama);
        System.out.println("Kecepatan:" + kecepatan);
    }
} 

class KendaraanDarat extends Kendaraan{
    int jumlahRoda;
    
    @Override
    public void tampilkaninfo(){
        super.tampilkaninfo();
        System.out.println("jumlah Roda:" + jumlahRoda);
    }
}

class Mobil extends KendaraanDarat{
    int jumlahPintu;
    
    @Override
    public void tampilkaninfo(){
        super.tampilkaninfo();
        System.out.println("jumlah pintu:" + jumlahPintu);
    }
}

class SepedaMotor extends KendaraanDarat{
    String jenisMesin;
    
    @Override
    public void tampilkaninfo(){
        super.tampilkaninfo();
        System.out.println("jenis Mesin:" + jenisMesin);
    }
}
