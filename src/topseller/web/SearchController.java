package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.Category;
import topseller.models.User;
import topseller.service.CategoryService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/search")



public class SearchController {

    @Autowired
    CategoryService categoryService;
    @RequestMapping(method = RequestMethod.GET)
    public String getPage(Model model, HttpSession session , @ModelAttribute("keyword") String keyword , @ModelAttribute("type") String type) {
        if(type.equals("1")){
            return "redirect:/filtre?keyword="+keyword;
        }
        else {
            return "redirect:/filtre/shop?keyword="+keyword;
        }
    }
}
