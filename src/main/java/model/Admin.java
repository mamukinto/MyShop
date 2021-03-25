package model;

public class Admin extends User {
    final static String ID = "admin@gmail.com";
    final static String PASSWORD = "admin";

    public static String getID() {
        return ID;
    }

    public static String getPASSWORD() {
        return PASSWORD;
    }
}
