public abstract class Animal {
    private int id;
    private String klichka;

    public Animal(int id, String klichka) {
        this.id = id;
        this.klichka = klichka;
    }

    public int getID(){
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setKlichka(String klichka) {
        this.klichka = klichka;
    }

    public String getKlichka() {
        return klichka;
    }

    @Override
    public String toString() {
        return "Animal: id=" + id + ", klichka=" + klichka;
    };

}
