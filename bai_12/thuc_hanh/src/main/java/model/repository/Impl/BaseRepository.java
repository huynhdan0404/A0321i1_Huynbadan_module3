package model.repository.Impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/demo1";
    private String jdbcUsername = "root";
    private String jdbcPassword = "04041998a";
    private Connection connection;

    public BaseRepository() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection(jdbcUrl,jdbcUsername,jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Connection getConnection(){
        return this.connection;
    }
}
