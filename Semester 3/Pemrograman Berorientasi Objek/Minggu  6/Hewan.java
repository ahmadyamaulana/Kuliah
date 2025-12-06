package praktikum6;

/**
 *
 * @author Acer
 */
public class Hewan {
    public void bersuara() {
        System.out.println("Hewan bersuara");
    }
    
    public void makan(String makanan){
        System.out.println("Hewan Makan" + makanan);
    }
    
    public void makan(String makanan, int jumlah) {
        System.out.println("Hewan Makan" + jumlah + "porsi" + makanan); 
    }
}
