package service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ShopUtils {
    public static String getFormattedDate() {
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        return myDateObj.format(myFormatObj);
    }

    public static String getShortDescription(String description) {
        String shortDescription = null;
        // magic - get first 3 words and add "..."
        return shortDescription;
    }
}
