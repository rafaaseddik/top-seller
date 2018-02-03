package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import topseller.models.FormException;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.service.FileService;
import topseller.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/logout")
public class LogoutController {
    @Autowired
    UserService userService;
    @Autowired
    FileService fileService;
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String handleLogout(HttpSession session) {
        session.removeAttribute("loggedUser");
        return "redirect:/home";
    }



}
