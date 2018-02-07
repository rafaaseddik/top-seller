package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.config.GlobalVariables;
import topseller.models.Category;
import topseller.models.Product;
import topseller.models.ProductReport;
import topseller.models.User;
import topseller.service.CategoryService;
import topseller.service.ProductService;
import topseller.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    @RequestMapping(method = RequestMethod.GET)
    public String visitHome(@ModelAttribute("id") int id,Model model, HttpSession session) {
        Product product = productService.getProductByID(id);
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        ArrayList<Product> listSuggestedProducts = productService.getSuggestedProducts(product,6);
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        if(product != null){
            model.addAttribute("pageName","product");
            model.addAttribute("product",product);
            model.addAttribute("listSuggestedProducts",listSuggestedProducts);
            model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
            return "detailsProduct";
        }
        else {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "report",method = RequestMethod.GET)
    public String reportProduct(@ModelAttribute("id") int id , @ModelAttribute("description") String description ,Model model, HttpSession session) {
        Product product = productService.getProductByID(id);
        User loggedUser = (User) session.getAttribute("loggedUser");
        if(product != null && loggedUser != null){
            ProductReport report = new ProductReport();
            report.setDescription(description);
            report.setSubject(product);
            report.setUser(loggedUser);
            productService.reportProduct(report);
        }
        return "redirect:/product?id="+id;
    }


    }
