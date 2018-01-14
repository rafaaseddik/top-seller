package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.portlet.ModelAndView;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.service.UserService;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
    @Autowired
    UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String handleLogin(Model model) {

        return "home/home";
    }

}
