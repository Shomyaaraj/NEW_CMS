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
        }

        // Environment variables se override
        String envUrl = System.getenv("DATABASE_URL");
        if (envUrl != null && !envUrl.isEmpty()) {
            url = envUrl;
            // postgres:// → jdbc:postgresql://
            if (url.startsWith("postgres://")) {
                url = url.replace("postgres://", "jdbc:postgresql://");
            } else if (url.startsWith("postgresql://")) {
                url = url.replace("postgresql://", "jdbc:postgresql://");
            }
            // SSL add karo agar nahi hai
            if (!url.contains("sslmode")) {
                url += "?sslmode=require";
            }
        }

        String envUser = System.getenv("PGUSER");
        if (envUser != null && !envUser.isEmpty()) username = envUser;

        String envPass = System.getenv("PGPASSWORD");
        if (envPass != null && !envPass.isEmpty()) password = envPass;

        Class.forName(driver);

        System.out.println("DB URL: " + url);
        System.out.println("DB User: " + username);

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
        try {
            InputStream schemaStream = DatabaseUtil.class.getClassLoader().getResourceAsStream("schema.sql");
            if (schemaStream != null) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(schemaStream));
                StringBuilder sql = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    // Comments skip karo
                    if (!line.trim().startsWith("--")) {
                        sql.append(line).append("\n");
                    }
                }
                reader.close();

                // PostgreSQL mein multiple statements alag execute karne padte hain
                String[] statements = sql.toString().split(";");
                for (String statement : statements) {
                    String trimmed = statement.trim();
                    if (!trimmed.isEmpty()) {
                        try (Statement stmt = conn.createStatement()) {
                            System.out.println("Executing: " + trimmed.substring(0, Math.min(50, trimmed.length())) + "...");
                            stmt.execute(trimmed);
                        } catch (SQLException e) {
                            // Already exists errors ignore karo
                            System.err.println("Statement warning (ignored): " + e.getMessage());
                        }
                    }
                }

                System.out.println("Database initialized successfully!");

                // Verify
                try (Statement stmt = conn.createStatement();
                     java.sql.ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users")) {
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