package topseller.service;

import topseller.models.FormException;
import topseller.models.LoginUser;
import topseller.models.User;

import java.util.ArrayList;

public interface UserService {
    public void signup(User newUser);
    public User signin(LoginUser loginUser);
    public boolean validateLoginUser(LoginUser loginUser);
    public boolean validateNewUser(User User)throws FormException;
    public boolean checkExistingUser(User newUser);

    ArrayList<User> getAllUsers();
}
