package topseller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.User;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {
    @RequestMapping(method = RequestMethod.GET)
    public String getPage(Model model, HttpSession session) {
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "contact";
        model.addAttribute("pageName",pageName);
        return pageName;
    }
}
