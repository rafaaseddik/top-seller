package topseller.web;

import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.portlet.ModelAndView;
import java.util.ArrayList;

import topseller.config.GlobalVariables;
import topseller.models.*;
import topseller.service.CategoryService;
import topseller.service.ShopService;
import topseller.service.UserService;
import topseller.service.ProductService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    ShopService shopService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping(method = RequestMethod.GET)
    public String visitHome(Model model, HttpSession session) {
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        ArrayList<Product> listNewArivalProduct = productService.getLatestProductsList(8);
        ArrayList<Shop> listShops = shopService.getBestShops(10);
        ArrayList<Pair<Category,ArrayList<Product>>> listRecommendedProducts = productService.getRecommendedProducts();
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "home";
        model.addAttribute("pageName",pageName);
        model.addAttribute("listNewArivalProduct",listNewArivalProduct);
        model.addAttribute("listShops",listShops);
        model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
        model.addAttribute("listRecommendedProducts", listRecommendedProducts);
        return pageName;
    }

}
