import java.sql.Connection;
import java.sql.SQLException;
import database.Connector.connect;

public class DBoperator {

    private Connection connect;

    public void createTable() throws SQLException, ClassNotFoundException {
        String CREATE_TABLE =
                "CREATE TABLE " + DataForConnect.TABLE
                        + " (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,"
                        + "date_of_birth DATE),"
                        + "klichka VARCHAR(30) NOT NULL,"
                        + "commands TEXT,"
                        + "`type` ENUM('Pets','PackAnimals'),"
                        + "view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel');";
        this.connect = connect();
        try (Connection connection = this.connect) {
            Statement statement = connection.createStatement();
            statement.executeUpdate(CREATE_TABLE);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
}
