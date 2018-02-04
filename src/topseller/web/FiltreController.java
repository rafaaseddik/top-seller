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
import topseller.models.ProductStatus;
import topseller.models.User;
import topseller.service.CategoryService;
import topseller.service.ProductService;
import topseller.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/filtre")
public class FiltreController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping(method = RequestMethod.GET)
    public String visitHome(Model model, HttpSession session , @ModelAttribute("cat_id") String Icat_id , @ModelAttribute("condition") String status , @ModelAttribute("minPrice") String  IminPrice , @ModelAttribute("maxPrice") String ImaxPrice  , @ModelAttribute("keyword") String keyword , @ModelAttribute("page") String page   ) {
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        int cat_id = getIntValue(Icat_id,0);
        int minPrice = getIntValue(IminPrice,0);
        int maxPrice = getIntValue(ImaxPrice,GlobalVariables.getMaxPrice());
        int limit = 9;
        Category c = new Category();
        if(cat_id != 0) {
            c.setId(cat_id);
        }
        else {
            c = Category.ANY_CATEGORY();
        }
        int nbPages = productService.nb_searchProducts(keyword,c,maxPrice,minPrice,ProductStatus.toProductStatus(status),limit);;
        int currentPage = getIntValue(page,1) <= nbPages ? getIntValue(page,1) : 1;
        ArrayList<Product> listProduits = productService.searchProducts(keyword,c,maxPrice,minPrice,ProductStatus.toProductStatus(status),limit,currentPage-1);
        ProductStatus condition = (status == "") ? ProductStatus.ANY : ProductStatus.toProductStatus(status);
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        model.addAttribute("pageName","filtre");
        model.addAttribute("cat_id",cat_id);
        model.addAttribute("condition",condition);
        model.addAttribute("minPrice",minPrice);
        model.addAttribute("maxPrice",maxPrice);
        model.addAttribute("keyword",keyword);
        model.addAttribute("nbPages",nbPages);
        model.addAttribute("page",currentPage);
        model.addAttribute("limit",limit);
        model.addAttribute("imagesServerURL",GlobalVariables.imagesServerURL());
        model.addAttribute("listProduits",listProduits);
        return "filtre";
    }

    private int getIntValue(String value, int defaultValue){
        if(value != ""){
            try{
                return Integer.parseInt(value);
            }catch (Exception e){}
        }
        return defaultValue;
    }

}
