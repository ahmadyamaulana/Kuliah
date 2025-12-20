package perpustakaan;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Peminjaman implements Serializable {
    private Anggota anggota;
    private List<Buku> daftarBuku;

    public Peminjaman(Anggota anggota) {
        this.anggota = anggota;
        this.daftarBuku = new ArrayList<>();
    }

    public void tambahBuku(Buku buku) {
        daftarBuku.add(buku);
        buku.pinjam();
    }

    public void tampilPeminjaman() {
        anggota.tampilInfo();
        System.out.println("Daftar Buku Dipinjam:");
        for (Buku b : daftarBuku) {
            System.out.println("- " + b.getJudul());
        }
    }
}
