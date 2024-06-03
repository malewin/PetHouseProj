import java.util.ArrayList;

public class FriendsOfHuman extends Animal implements Commands {

    private int id;
    private String klichka;
    private Date date_of_bitrh;
    private ArrayList commands = new ArrayList<String>();
    
    public FriendsOfHuman(int id, String klichka, Date date_of_bitrh) {
        super(id, klichka);
        this.date_of_bitrh = date_of_bitrh;
    }

    @Override
    public String toString() {
        return super.toString() + ", date_of_bitrh=" + date_of_bitrh;
    }

    public Date getDate_of_bitrh() {
        return date_of_bitrh;
    }

    public void setDate_of_bitrh(Date date_of_bitrh) {
        this.date_of_bitrh = date_of_bitrh;
    }
    
}