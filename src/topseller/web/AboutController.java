package topseller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/about")
public class AboutController {
    @RequestMapping(method = RequestMethod.GET)
    public String getPage(Model model) {
        String pageName = "about";
        model.addAttribute("pageName",pageName);
        return pageName;
    }
}
