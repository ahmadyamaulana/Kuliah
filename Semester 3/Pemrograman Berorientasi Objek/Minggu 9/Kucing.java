/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package praktikum9;

/**
 *
 * @author Acer
 */
public class Kucing extends Hewan{
     @Override
    void Suara() {
        System.out.println("Kucing mengeluarkan suara: Meong");
    }
}
class Anjing extends Hewan{
    @Override
    void Suara() {
        System.out.println("Anjing mengeluarkan suara: Guk Guk");
    }    
}
