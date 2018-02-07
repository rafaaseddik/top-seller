package topseller.DAO;

import topseller.models.LoginUser;
import topseller.models.User;

import java.util.ArrayList;

public interface UserDAO {
    void signup(User newUser);

    User signin(LoginUser loginUser);

    User getUserByEmail(String email);

    User getUserByID(int userID);

    ArrayList<User> getAllUsers();

    void createNewAdmin(User newAdmin);
}
