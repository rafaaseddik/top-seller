package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import topseller.config.GlobalVariables;
import topseller.models.*;
import topseller.service.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    CategoryService categoryService;
    @Autowired
    UserService userService;
    @Autowired
    ShopService shopService;
    @Autowired
    FileService fileService;
    @Autowired
    ProductService productService;
    @Autowired
    ContactService contactService;

    @RequestMapping(value = "/users",method = RequestMethod.GET)
    public String getListUsers(Model model, HttpSession session){
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.ADMIN)) return "redirect:/login/signin";
        ArrayList<User> listUsers = userService.getAllUsers();
        model.addAttribute("listUsers",listUsers);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        model.addAttribute("listSuperCategories",categoryService.getSuperCategories());
        return "admin/users";
    }

    @RequestMapping(value = "/products",method = RequestMethod.GET)
    public String getListProducts(Model model, HttpSession session){
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.ADMIN)) return "redirect:/login/signin";
        ArrayList<Product> listProducts = productService.getAllProducts();
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        model.addAttribute("listSuperCategories",categoryService.getSuperCategories());
        model.addAttribute("listProducts",listProducts);
        return "admin/products";
    }

    @RequestMapping(value = "/reports",method = RequestMethod.GET)
    public String getListReports(Model model, HttpSession session){
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.ADMIN)) return "redirect:/login/signin";
        ArrayList<ProductReport> listProductReports = productService.getProductReportsList();
        ArrayList<ShopReport> listShopReports = shopService.getShopReportsList();
        model.addAttribute("listProductReports",listProductReports);
        model.addAttribute("listShopReports",listShopReports);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        model.addAttribute("listSuperCategories",categoryService.getSuperCategories());
        return "admin/reports";
    }


    @RequestMapping(value = "/messages",method = RequestMethod.GET)
    public String getListMessages(Model model, HttpSession session){
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.ADMIN)) return "redirect:/login/signin";
        ArrayList<Message> listMessages = contactService.getMessages();
        model.addAttribute("listMessages",listMessages);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        model.addAttribute("listSuperCategories",categoryService.getSuperCategories());
        return "admin/messages";
    }



    @RequestMapping(value = "/shops",method = RequestMethod.GET)
    public String getPage(Model model, HttpSession session) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.ADMIN)) return "redirect:/login/signin";
        ArrayList<Shop> listShops = shopService.getAllShops();
        System.out.println("shops");
        System.out.println(listShops);
        model.addAttribute("listSuperCategories",categoryService.getSuperCategories());
        model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
        model.addAttribute("listShops",listShops);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "sh";
        model.addAttribute("pageName",pageName);
        return "admin/shops";
    }


}
