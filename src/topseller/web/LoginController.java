package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;
import topseller.models.FormException;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.service.FileService;
import topseller.service.UserService;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @Autowired
    UserService userService;
    @Autowired
    FileService fileService;

    @RequestMapping(value = "/signin",method = RequestMethod.POST)
    public String handleSignin(@ModelAttribute("login") LoginUser loginUser,Model model) {
        ArrayList<String> errorList= new ArrayList<String>();
        if(!this.userService.validateLoginUser(loginUser)){
            errorList.add("Email invalid");
            model.addAttribute("errors",errorList);
            return "login/signin";
        }
        User loggedUser = this.userService.signin(loginUser);
        if(loggedUser==null){
            errorList.add("There was an error with your E-Mail/Password combination. Please try again.");
            model.addAttribute("errors",errorList);
            return "login/signin";
        }
        System.out.println(loggedUser.toString());
        model.addAttribute("loggedUser",loggedUser);
        return "redirect:/home";
    }

    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String showSignin(Model model){
            model.addAttribute("login",new LoginUser());
        return "login/signin";
    }

    @RequestMapping(value = "/signup",method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String handleSignup(@RequestParam("avatar_url")MultipartFile file, @ModelAttribute("newUser") User newUser, Model model) {
        ArrayList<String> errorList= new ArrayList<String>();
        try{
            this.userService.validateNewUser(newUser);
        }
        catch (FormException e){
            e.printStackTrace();
            errorList.add(e.getMessage());
            model.addAttribute("errors",errorList);
            return "login/signup";
        }
        try{
            newUser.setAvatarUrl(fileService.writeFile(file.getBytes(),System.currentTimeMillis()+file.getOriginalFilename()));
        }catch (Exception e){
            e.printStackTrace();
        }



        this.userService.signup(newUser);

        System.out.println(newUser.toString());
        return "redirect:/home";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String showSignup(Model model){
        model.addAttribute("newUser",new User());
        return "login/signup";
    }



}
