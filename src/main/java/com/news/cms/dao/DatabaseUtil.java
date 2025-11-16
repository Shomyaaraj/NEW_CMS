package com.news.cms.dao;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DatabaseUtil {
    private static String driver;
    private static String url;
    private static String username;
    private static String password;
    private static boolean initialized = false;

    static {
        try {
            Properties props = new Properties();
            InputStream input = DatabaseUtil.class.getClassLoader().getResourceAsStream("db.properties");
            if (input != null) {
                props.load(input);
                driver = props.getProperty("db.driver");
                url = props.getProperty("db.url");
                username = props.getProperty("db.username");
                password = props.getProperty("db.password");
                Class.forName(driver);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        try {
            System.out.println("Attempting to connect to database with URL: " + url);
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("Database connection established successfully");

            if (!initialized) {
                System.out.println("Database not initialized yet, initializing...");
                initializeDatabase(conn);
                initialized = true;
            }
            return conn;
        } catch (SQLException e) {
            System.err.println("Failed to get database connection: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    private static void initializeDatabase(Connection conn) {
        try (Statement stmt = conn.createStatement()) {
            // Read and execute schema.sql
            InputStream schemaStream = DatabaseUtil.class.getClassLoader().getResourceAsStream("schema.sql");
            if (schemaStream != null) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(schemaStream));
                StringBuilder sql = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sql.append(line).append("\n");
                }
                reader.close();

                // Execute the entire SQL as one statement
                String fullSql = sql.toString();
                System.out.println("Executing schema SQL: " + fullSql);
                stmt.execute(fullSql);
                System.out.println("Database initialized successfully!");

                // Verify users were inserted
                try (java.sql.ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users")) {
                    if (rs.next()) {
                        System.out.println("Users table has " + rs.getInt(1) + " records");
                    }
                }
            } else {
                System.err.println("schema.sql not found in classpath!");
            }
        } catch (Exception e) {
            System.err.println("Error initializing database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
