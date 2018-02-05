package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.*;
import topseller.service.CategoryService;
import topseller.service.ProductService;
import topseller.service.ShopService;

import java.util.ArrayList;


@Controller
@RequestMapping(value = "test")
public class TestController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ShopService shopService;
    @Autowired
    ProductService productService;

    @RequestMapping(method = RequestMethod.GET)
    public String test(Model model) {
        Category category = new Category();
        category.setId(2);
        System.out.println(shopService.nb_searchShops("",Category.ANY_CATEGORY(),"",1));
        System.out.println("---------------------------------");
        System.out.println(shopService.nb_searchShops("",category,"",1));
        return "test";
    }
}
