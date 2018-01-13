package topseller.service;

import org.springframework.beans.factory.annotation.Autowired;

import topseller.DAO.UserDAO;
import topseller.models.LoginUser;
import topseller.models.User;


public class UserServiceImpl implements UserService{
    @Autowired
    UserDAO userDAO;
    @Override
    public void signup(User newUser) {
        this.userDAO.signup(newUser);
    }

    @Override
    public User signin(LoginUser loginUser) {
        return this.userDAO.signin(loginUser);
    }
}
