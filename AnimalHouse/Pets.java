public class Pets extends FriendsOfHuman{
    
    private String type = "Pets";

    public Pets(int id, String klichka, Date date_of_bitrh, String type) {
        super(id, klichka, date_of_bitrh);
        this.type = type;
    }

    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return super.toString() + ", type=" + type;
    }
    
}
