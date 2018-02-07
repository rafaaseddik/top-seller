package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.config.GlobalVariables;
import topseller.models.*;
import topseller.service.CategoryService;
import topseller.service.ProductService;
import topseller.service.ShopService;
import topseller.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    ShopService shopService;
    @Autowired
    CategoryService categoryService;
    @RequestMapping(method = RequestMethod.GET)
    public String visitHome(@ModelAttribute("id") int id,Model model, HttpSession session) {
        Shop shop = shopService.getShopByID(id);

        if(shop != null){
            ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
            ArrayList<Product> listProduits = productService.getProductsByShop(shop);
            model.addAttribute("listSuperCategories",listSuperCategories);
            model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
            model.addAttribute("pageName","shop");
            model.addAttribute("shop",shop);
            model.addAttribute("id",id);
            model.addAttribute("listProduits",listProduits);
            model.addAttribute("formComment",new FormComment(0,""));
            model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
            return "detailsShop";
        }
        else {
            return "redirect:/404";
        }
    }

    @RequestMapping(method = RequestMethod.POST)
    public String doComment(@ModelAttribute("id") int id, @ModelAttribute("formComment") FormComment formComment , Model model, HttpSession session) {
        Shop shop = shopService.getShopByID(id);
        Comment c = new Comment();
        c.setScore(formComment.rate);
        c.setUser((User)session.getAttribute("loggedUser"));
        c.setText(formComment.comment);
        if(c.getUser() == null) return "redirect:/shop?id="+id;
        shopService.rateShop(shop,c);
        return "redirect:/shop?id="+id;
    }

    @RequestMapping(value = "report",method = RequestMethod.GET)
    public String reportShop(@ModelAttribute("id") int id , @ModelAttribute("description") String description ,Model model, HttpSession session) {
        Shop shop = shopService.getShopByID(id);
        User loggedUser = (User) session.getAttribute("loggedUser");
        if(shop != null && loggedUser != null){
            ShopReport report = new ShopReport();
            report.setDescription(description);
            report.setSubject(shop);
            report.setUser(loggedUser);
            shopService.reportShop(report);
        }
        return "redirect:/shop?id="+id;
    }

}
