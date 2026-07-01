package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	private static final String URL = "jdbc:mysql://localhost:3306/real_madrid?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
    private static final String USER = "root";
    private static final String PASS = "root"; // ako imaš MySQL lozinku, upiši je ovdje

    public static Connection getConnection() throws Exception {
    	Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
