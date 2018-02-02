package topseller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {
    @RequestMapping(method = RequestMethod.GET)
    public String getPage(Model model) {
        String pageName = "contact";
        model.addAttribute("pageName",pageName);
        return pageName;
    }
}
