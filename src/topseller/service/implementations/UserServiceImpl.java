package topseller.service.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.validator.routines.EmailValidator;

import org.springframework.stereotype.Service;
import topseller.DAO.UserDAO;
import topseller.models.FormException;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.service.UserService;

import java.util.ArrayList;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO userDAO;
    @Override
    public void signup(User newUser) {
        if(this.userDAO.getUserByEmail(newUser.getEmail())==null){
            System.out.println("new");
        }
        else{
            System.out.println("existing");
        }
        this.userDAO.signup(newUser);

    }

    @Override
    public User signin(LoginUser loginUser) {
        return this.userDAO.signin(loginUser);
    }

    @Override
    public boolean validateLoginUser(LoginUser loginUser) {
        return EmailValidator.getInstance().isValid(loginUser.getEmail());
    }

    @Override
    public boolean validateNewUser(User user)throws FormException {
        if(user.getFname().length()==0 || user.getFname().length()>255) {
            throw new FormException("Invalid first name");
        }
        if(user.getLname().length()==0 || user.getLname().length()>255) {
            throw new FormException("Invalid last name");
        }
        if(!EmailValidator.getInstance().isValid(user.getEmail())){
            System.out.println(user.getEmail());
            throw new FormException("Invalid email");
        }
        if(checkExistingUser(user)){
            throw new FormException("Exisiting email");
        }
        if(user.getPassword().length()==0 || user.getPassword().length()>255) {
            throw new FormException("Invalid password");
        }
        if(user.getRegion().length()==0 || user.getRegion().length()>255) {
            throw new FormException("Invalid region");
        }
        if(user.getPhone().length()!=0 && user.getPhone().length()<15) {
            try{
                Integer.parseInt(user.getPhone());
            }catch(NumberFormatException e){
                throw new FormException("Invalid phone number");
            }
        }else{
            throw new FormException("Invalid phone number");
        }
        return true;
    }
    public void addUserToSession(User user){

    }
    public void getUserFromSession(){

    }
    public boolean checkExistingUser(User newUser){
        return (this.userDAO.getUserByEmail(newUser.getEmail())!=null);
    }
    @Override
    public ArrayList<User> getAllUsers(){return this.userDAO.getAllUsers(); }

    @Override
    public void createNewAdmin(User newAdmin) {
        this.userDAO.createNewAdmin(newAdmin);
    }
}
