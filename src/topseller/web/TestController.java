package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.Category;
import topseller.models.Product;
import topseller.models.ProductStatus;
import topseller.models.Shop;
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
    public String test(Model model){
        Category category = new Category();
        category.setId(2);
        Product product = this.productService.searchProducts("",Category.ANY_CATEGORY(),Product.MAX_PRICE,0,ProductStatus.USED,1,0).get(0);
        System.out.println(product);
        System.out.println(this.productService.getSuggestedProducts(product,5));
        return "test";
    }
}
