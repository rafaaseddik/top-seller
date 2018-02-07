package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.*;
import topseller.service.CategoryService;
import topseller.service.ContactService;
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
    @Autowired
    ContactService contactService;
    @RequestMapping(method = RequestMethod.GET)
    public String test(Model model) {
        Category category = new Category();
        category.setId(2);
        Message msg = new Message();
        msg.setMessage("This is my fourth message");
        msg.setSubject("testing");
        msg.setFullname("Seddik Mohamed Rafaa");
        msg.setEmail("rafaaseddik@yahoo.fr");
        msg.setId(2);
        this.contactService.deleteMessage(msg);
        msg.setId(3);
        this.contactService.setMessageAsRead(msg);
        System.out.println(this.contactService.getMessages());

        return "test";
    }
}