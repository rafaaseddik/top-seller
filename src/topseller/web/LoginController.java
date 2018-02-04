package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;
import topseller.models.Category;
import topseller.models.FormException;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.service.CategoryService;
import topseller.service.FileService;
import topseller.service.UserService;

import javax.servlet.http.HttpSession;
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
    @Autowired
    CategoryService categoryService;
    @RequestMapping(value = "/signin",method = RequestMethod.POST)
    public String handleSignin(@ModelAttribute("login") LoginUser loginUser, Model model, HttpSession session) {
        ArrayList<String> errorList= new ArrayList<String>();
        if(!this.userService.validateLoginUser(loginUser)){
            errorList.add("Email invalid");
        }
        if(loginUser.getPassword().length()<8){
            errorList.add("Password must be at least 8 characters long");
        }
        if(errorList.isEmpty()){
            User loggedUser = this.userService.signin(loginUser);
            if(loggedUser==null){
                errorList.add("There was an error with your E-Mail/Password combination. Please try again.");
                model.addAttribute("errors",errorList);
                return "login/signin";
            }
            //model.addAttribute("loggedUser",loggedUser);
            session.setAttribute("loggedUser",loggedUser);
            return "redirect:/home";
        }
        else {
            model.addAttribute("errors",errorList);
            return "login/signin";
        }
    }

    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String showSignin(Model model,HttpSession session){
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("login",new LoginUser());
        return "login/signin";
    }

    @RequestMapping(value = "/signup",method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String handleSignup(@RequestParam("avatar_url")MultipartFile file, @ModelAttribute("newUser") User newUser, Model model,HttpSession session) {
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

        session.setAttribute("loggedUser",newUser);

        System.out.println(newUser.toString());
        return "redirect:/home";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String showSignup(Model model,HttpSession session){
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("newUser",new User());
        return "login/signup";
    }



}
