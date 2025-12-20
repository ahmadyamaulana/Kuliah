package perpustakaan;

import java.io.Serializable;

public abstract class Koleksi implements Serializable {
    protected String id;
    protected String judul;

    public Koleksi(String id, String judul) {
        this.id = id;
        this.judul = judul;
    }

    public abstract void tampilInfo();

    public String getId() {
        return id;
    }

    public String getJudul() {
        return judul;
    }
}
