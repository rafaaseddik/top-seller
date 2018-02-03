package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.portlet.ModelAndView;
import java.util.ArrayList;
import topseller.models.LoginUser;
import topseller.models.Product;
import topseller.models.User;
import topseller.models.ProductReport;
import topseller.models.Report;
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

    @RequestMapping(method = RequestMethod.GET)
    public String visitHome(Model model, HttpSession session) {
        /*User rafaa = new User();
        rafaa.setId(6);
        ProductReport report = new ProductReport();
        report.setDescription("descr");
        report.setUser(rafaa);
        report.setSubject(productService.getProductByID(1));
        this.productService.reportProduct(report);
        this.productService.addProduct(Product.getMockProduct());
        Product toEdit = Product.getMockProduct();
        toEdit.setId(6);

        this.productService.blockProduct(toEdit);
        ArrayList<Product> latest = this.productService.getLatestProductsList(3);
        for(Product reporte:latest){
            System.out.println(reporte);
        }
        model.addAttribute("produit",productService.getProductByID(1));*/
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "home";
        model.addAttribute("pageName",pageName);
        return pageName;
    }

}
