package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.service.CategoryService;
import topseller.service.ShopService;


@Controller
@RequestMapping(value = "test")
public class TestController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ShopService shopService;
    @RequestMapping(method = RequestMethod.GET)
    public String test(Model model){
        System.out.println(this.shopService.getShopByID(1));
        return "test";
    }
}
