import database.ConnectionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class main {
    public static void main(String[] args) {

        try {
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost/usermanagement","dbabdo","dbabdo");

            System.out.println("DONE");

        } catch (SQLException e) {
                e.printStackTrace();
        }


    }
}
