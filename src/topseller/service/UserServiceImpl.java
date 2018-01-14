package topseller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.stereotype.Service;
import topseller.DAO.UserDAO;
import topseller.models.LoginUser;
import topseller.models.User;


@Service
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

    @Override
    public boolean validateLoginUser(LoginUser loginUser) {
        return (loginUser.getPassword().length()>=8)&&EmailValidator.getInstance().isValid(loginUser.getEmail());
    }

    @Override
    public boolean validateNewUser(User User) {
        return true;
    }
}
