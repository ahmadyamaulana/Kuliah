package perpustakaan;

public class Buku extends Koleksi implements StatusBuku {
    private String penulis;
    private boolean statusDipinjam;

    public Buku(String id, String judul, String penulis) {
        super(id, judul);
        this.penulis = penulis;
        this.statusDipinjam = false;
    }

    @Override
    public void pinjam() {
        if (!statusDipinjam) {
            statusDipinjam = true;
            System.out.println(judul + " berhasil dipinjam.");
        } else {
            System.out.println(judul + " sedang dipinjam.");
        }
    }

    @Override
    public void kembalikan() {
        statusDipinjam = false;
        System.out.println(judul + " berhasil dikembalikan.");
    }

    @Override
    public void tampilInfo() {
        System.out.println("ID: " + id);
        System.out.println("Judul: " + judul);
        System.out.println("Penulis: " + penulis);
        System.out.println("Status: " + (statusDipinjam ? "Dipinjam" : "Tersedia"));
    }
}
