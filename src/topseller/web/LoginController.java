package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.portlet.ModelAndView;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.service.UserService;

import javax.jws.WebParam;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/login/submit",method = RequestMethod.POST)
    public String handleLogin(@ModelAttribute("login") LoginUser loginUser) {
        System.out.println(loginUser.toString());
        User loggedUser = this.userService.signin(loginUser);
        System.out.println(loggedUser.toString());
        return "listPersons";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLogin(Model model){
        //ModelAndView model = new ModelAndView("login");
        System.out.println("rsqdddddddddddddddddqdqsdqsez");
            model.addAttribute("login",new LoginUser());
            model.addAttribute("name","hello");
        return "login";
    }
    @RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("user") User user) {

        return new ModelAndView("subittt");
    }
}
