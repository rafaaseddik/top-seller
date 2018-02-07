package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import topseller.models.*;
import topseller.service.CategoryService;
import topseller.service.ContactService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {
    @Autowired
    CategoryService categoryService;

    @Autowired
    ContactService contactService;

    @RequestMapping(method = RequestMethod.GET)
    public String getPage(Model model, HttpSession session) {
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        FormContact formContact = new FormContact();
        User loggedUser = (User) session.getAttribute("loggedUser");
        if(loggedUser != null){
            formContact.setFullName(loggedUser.getFname()+" "+loggedUser.getLname());
            formContact.setEmail(loggedUser.getEmail());
        }
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("formContact",formContact);
        model.addAttribute("loggedUser",loggedUser);
        String pageName = "contact";
        model.addAttribute("pageName",pageName);
        return pageName;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String doContact(Model model, HttpSession session , @ModelAttribute("formContact") FormContact formContact) {
        Message m = new Message();
        m.setEmail(formContact.getEmail());
        m.setFullname(formContact.getFullName());
        m.setMessage(formContact.getMessage());
        m.setSubject(formContact.getSubject());
        contactService.sendMessage(m);
        return "redirect:/contact";
    }
}
