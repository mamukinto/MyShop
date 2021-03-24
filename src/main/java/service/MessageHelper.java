package service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MessageHelper {
    public static String getFormattedDate() {
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        return myDateObj.format(myFormatObj);
    }
}
