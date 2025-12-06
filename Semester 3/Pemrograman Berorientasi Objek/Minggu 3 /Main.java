/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.praktikumpbo4;

/**
 *
 * @author Maullovers
 */
public class Main {
    public static void main(String[] args) {
        Pekerja pekerja = new Pekerja("Agus", 17, "Jualan Mie Ayam", 500000);
        System.out.println(pekerja.toString());
        
        pekerja.setNama("Aceng");
        System.out.println(pekerja.toString());
    }
}
