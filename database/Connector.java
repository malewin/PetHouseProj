import java.sql.*;

public class Connector {
    private Connection connect;

    static Connection connect() throws ClassNotFoundException, SQLException {
        Class.forName(DataForConnect.DRIVER);
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DataForConnect.URL, DataForConnect.USER, DataForConnect.PASS);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
}

