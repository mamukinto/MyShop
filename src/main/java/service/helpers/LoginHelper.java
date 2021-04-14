package service.helpers;

import model.exceptions.ShopException;
import service.dao.UserDAO;

import java.util.concurrent.atomic.AtomicBoolean;

public class LoginHelper {
    public static boolean isValid(String email,String password) throws ShopException {
        AtomicBoolean result = new AtomicBoolean(false);
        UserDAO userDAO = new UserDAO();
        userDAO.getUsers().forEach(user -> {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                result.set(true);
            }
        });
        return result.get();
    }
}
