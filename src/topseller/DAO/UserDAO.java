package topseller.DAO;

import topseller.models.LoginUser;
import topseller.models.User;

import java.util.ArrayList;

public interface UserDAO {
    public void signup(User newUser);
    public User signin(LoginUser loginUser);
    public User getUserByEmail(String email);
    User getUserByID(int userID);

    ArrayList<User> getAllUsers();
}
