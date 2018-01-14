package topseller.service;

import topseller.models.LoginUser;
import topseller.models.User;

public interface UserService {
    public void signup(User newUser);
    public User signin(LoginUser loginUser);
    public boolean validateLoginUser(LoginUser loginUser);
    public boolean validateNewUser(User User);
}
