package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.config.GlobalVariables;
import topseller.models.Category;
import topseller.models.ProductStatus;
import topseller.models.Shop;
import topseller.models.User;
import topseller.service.CategoryService;
import topseller.service.ProductService;
import topseller.service.ShopService;
import topseller.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/filtre/shop")
public class FiltreShopController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    ShopService shopService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping(method = RequestMethod.GET)
    public String visitHome(Model model, HttpSession session , @ModelAttribute("cat_id") String Icat_id  , @ModelAttribute("keyword") String keyword , @ModelAttribute("page") String page) {
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        int cat_id = getIntValue(Icat_id,0);
        Category c = new Category();
        if(cat_id != 0) {
            c.setId(cat_id);
        }
        else {
            c = Category.ANY_CATEGORY();
        }
        int limit = 10;
        int nbPages = shopService.nb_searchShops(keyword,c,"",limit);
        int currentPage = getIntValue(page,1) <= nbPages ? getIntValue(page,1) : 1;
        ArrayList<Shop> listShops = shopService.searchShops(keyword,c,"",limit,currentPage-1);
        System.out.println(listShops.toString());
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        model.addAttribute("pageName","shop");
        model.addAttribute("cat_id",cat_id);
        model.addAttribute("keyword",keyword);
        model.addAttribute("nbPages",nbPages);
        model.addAttribute("page",currentPage);
        model.addAttribute("limit",limit);
        model.addAttribute("imagesServerURL",GlobalVariables.imagesServerURL());
        model.addAttribute("listShops",listShops);
        return "filtreShop";
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
