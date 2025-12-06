/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikum5;

/**
 *
 * @author Maullovers
 */
public class Hewan {
    String nama;
    String jenis;
    
    public void infoHewan(){
        System.out.println("nama:"+ nama);
        System.out.println("jenis:"+ jenis);
    }
}

class Anjing extends Hewan {
   
    @Override
    public void infoHewan(){
        super.infoHewan();
        System.out.println("suara Anjing:guk guk ");
    }
}

class Kucing extends Hewan {
    
    @Override
    public void infoHewan(){
        super.infoHewan();
        System.out.println("suara kucing:meng meng ");
    }
}
