package perpustakaan;

import java.io.*;
import java.util.*;

public class Main {

    static List<Buku> daftarBuku = new ArrayList<>();
    static Scanner input = new Scanner(System.in);
    static Anggota anggota = new Anggota("A001", "User");
    static Peminjaman peminjaman = new Peminjaman(anggota);

    public static void main(String[] args) {

        int pilihan;

        do {
            System.out.println("\n=== MENU SISTEM MANAJEMEN BUKU ===");
            System.out.println("1. Tambah Buku (Simpan ke buku.txt)");
            System.out.println("2. Simpan Buku ke buku.ser (Serialisasi)");
            System.out.println("3. Tampilkan Buku dari buku.txt");
            System.out.println("4. Tampilkan Buku dari buku.ser");
            System.out.println("5. Pinjam Buku");
            System.out.println("6. Kembalikan Buku");
            System.out.println("0. Keluar");
            System.out.print("Pilih menu: ");

            pilihan = input.nextInt();
            input.nextLine();

            switch (pilihan) {
                case 1 -> tambahBukuTxt();
                case 2 -> simpanSerialisasi();
                case 3 -> tampilBukuTxt();
                case 4 -> tampilBukuSer();
                case 5 -> pinjamBuku();
                case 6 -> kembalikanBuku();
                case 0 -> System.out.println("Terima kasih. Program selesai.");
                default -> System.out.println("Menu tidak valid!");
            }

        } while (pilihan != 0);
    }

    // MENU 1 
    static void tambahBukuTxt() {
        try {
            System.out.print("ID Buku: ");
            String id = input.nextLine();
            System.out.print("Judul Buku: ");
            String judul = input.nextLine();
            System.out.print("Penulis: ");
            String penulis = input.nextLine();

            Buku buku = new Buku(id, judul, penulis);
            daftarBuku.add(buku);

            FileWriter fw = new FileWriter("buku.txt", true);
            fw.write(id + "," + judul + "," + penulis + "\n");
            fw.close();

            System.out.println("Buku berhasil ditambahkan.");

        } catch (IOException e) {
            System.out.println("Gagal menyimpan ke file teks.");
        }
    }

    // MENU 2 
    static void simpanSerialisasi() {
        try (ObjectOutputStream oos =
                     new ObjectOutputStream(new FileOutputStream("buku.ser"))) {

            oos.writeObject(daftarBuku);
            System.out.println("Data buku berhasil diserialisasi.");

        } catch (IOException e) {
            System.out.println("Gagal serialisasi.");
        }
    }

    // MENU 3 
    static void tampilBukuTxt() {
        try (BufferedReader br = new BufferedReader(new FileReader("buku.txt"))) {
            String baris;
            System.out.println("\n=== DATA BUKU (TXT) ===");
            while ((baris = br.readLine()) != null) {
                String[] data = baris.split(",");
                System.out.println("ID: " + data[0]);
                System.out.println("Judul: " + data[1]);
                System.out.println("Penulis: " + data[2]);
                System.out.println("------------------");
            }
        } catch (IOException e) {
            System.out.println("File buku.txt belum ada.");
        }
    }

    // MENU 4
    static void tampilBukuSer() {
        try (ObjectInputStream ois =
                     new ObjectInputStream(new FileInputStream("buku.ser"))) {

            List<Buku> bukuList = (List<Buku>) ois.readObject();
            System.out.println("\n=== DATA BUKU (SERIALISASI) ===");
            for (Buku b : bukuList) {
                b.tampilInfo();
                System.out.println("------------------");
            }

        } catch (IOException | ClassNotFoundException e) {
            System.out.println("File buku.ser belum ada.");
        }
    }

    // MENU 5
    static void pinjamBuku() {
        System.out.print("Masukkan ID Buku yang ingin dipinjam: ");
        String id = input.nextLine();

        for (Buku b : daftarBuku) {
            if (b.getId().equals(id)) {
                peminjaman.tambahBuku(b);
                return;
            }
        }
        System.out.println("Buku tidak ditemukan.");
    }

    // MENU 6 
    static void kembalikanBuku() {
        System.out.print("Masukkan ID Buku yang ingin dikembalikan: ");
        String id = input.nextLine();

        for (Buku b : daftarBuku) {
            if (b.getId().equals(id)) {
                b.kembalikan();
                return;
            }
        }
        System.out.println("Buku tidak ditemukan.");
    }
}
