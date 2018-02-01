package topseller.DAO;

import topseller.models.LoginUser;
import topseller.models.User;

public interface UserDAO {
    public void signup(User newUser);
    public User signin(LoginUser loginUser);
    public User getUserByEmail(String email);
    User getUserByID(int userID);
}
