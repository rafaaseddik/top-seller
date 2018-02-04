package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.Category;
import topseller.models.Product;
import topseller.models.ProductStatus;
import topseller.service.CategoryService;
import topseller.service.ProductService;
import topseller.service.ShopService;


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
        System.out.println(this.productService.searchProducts("iPhone",category,20,0, ProductStatus.BARELY_USED,5,0));
        System.out.println(this.productService.searchProducts("iPhone",Category.ANY_CATEGORY(), Product.MAX_PRICE,0, ProductStatus.ANY,5,0));
        return "test";
    }
}
