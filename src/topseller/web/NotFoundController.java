package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.Category;
import topseller.models.User;
import topseller.service.CategoryService;
import topseller.service.ProductService;
import topseller.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/404")
public class NotFoundController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    @RequestMapping(method = RequestMethod.GET)
    public String visitHome(Model model, HttpSession session) {
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("pageName","notfound");
        return "notfound";
    }

}
