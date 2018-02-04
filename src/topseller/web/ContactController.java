package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.Category;
import topseller.models.User;
import topseller.service.CategoryService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {
    @Autowired
    CategoryService categoryService;
    @RequestMapping(method = RequestMethod.GET)
    public String getPage(Model model, HttpSession session) {
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "contact";
        model.addAttribute("pageName",pageName);
        return pageName;
    }
}
