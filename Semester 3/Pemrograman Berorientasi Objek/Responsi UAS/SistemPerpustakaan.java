package perpustakaan;

import java.io.*;

public class SistemPerpustakaan {

    public static void simpanData(Object obj, String namaFile) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(namaFile))) {
            oos.writeObject(obj);
            System.out.println("Data berhasil disimpan.");
        } catch (IOException e) {
            System.out.println("Gagal menyimpan data: " + e.getMessage());
        }
    }

    public static Object bacaData(String namaFile) {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(namaFile))) {
            return ois.readObject();
        } catch (IOException | ClassNotFoundException e) {
            System.out.println("Gagal membaca data: " + e.getMessage());
            return null;
        }
    }
}
