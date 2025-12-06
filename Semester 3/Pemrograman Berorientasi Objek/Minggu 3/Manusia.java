/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.praktikumpbo4;

/**
 *
 * @author Maullovers
 */
public class Manusia {
    private String nama;
    protected int usia;
    public String pekerjaan;
    
    public Manusia(String nama, String pekerjaan, int usia) {
        this.nama = nama;
        this.usia = usia;
        this.pekerjaan = pekerjaan;
    }

    public String getNama() {
        return nama;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
}
