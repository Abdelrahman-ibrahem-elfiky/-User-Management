package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

        public static void Driver()
        {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

            } catch (Exception e)
            {
                e.printStackTrace();
            }

        }
    public static Connection connection () throws SQLException {

        Connection connection= DriverManager.getConnection("jdbc:mysql://localhost/usermanagement","dbabdo","dbabdo");
        return connection();
    }
}
