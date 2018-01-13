package topseller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import topseller.service.PersonManager;
import topseller.service.SimplePersonManager;


@Controller
public class UsersController {
    private PersonManager personManager;
    @GetMapping("/users")
    public String gerUsers(Model m){
        m.addAttribute("persons",this.personManager);
        System.out.println(this.personManager);
        return "listPersons";
    }
    public void setPersonManager(PersonManager personManager){
        this.personManager=personManager;
    }
}
