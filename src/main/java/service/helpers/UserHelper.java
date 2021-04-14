package service.helpers;

import model.User;
import model.exceptions.ShopException;
import service.dao.UserDAO;

public class UserHelper {
    public static User getUserByEmail(String email) throws ShopException {
        User user = new User();
        UserDAO userDAO = new UserDAO();
        for (User userDAOUser : userDAO.getUsers()) {
            if (userDAOUser.getEmail().equals(email)) {
                user = userDAOUser;
            }
        }
        return user;
    }
}
