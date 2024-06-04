import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class FriendsOfHuman extends Animal implements Commands {

    private Date date_of_bitrh;
    private List<String> commands = new ArrayList<String>();
    
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

    @Override
    public void learn_command(String command) {
        commands.add(command);
        System.out.println("Новая команда: " + command + " добавлена в список команд: " + commands);
    }

    @Override
    public String show_commands() {
        return String.join(", ",commands);
    }
    
    
}