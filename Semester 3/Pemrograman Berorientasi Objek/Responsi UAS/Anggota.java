package perpustakaan;

import java.io.Serializable;

public class Anggota implements Serializable {
    private String id;
    private String nama;

    public Anggota(String id, String nama) {
        this.id = id;
        this.nama = nama;
    }

    public void tampilInfo() {
        System.out.println("ID Anggota: " + id);
        System.out.println("Nama: " + nama);
    }
}
