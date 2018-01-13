package topseller.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.lang.annotation.Annotation;

@Controller
public class HelloController {
    @GetMapping("/hello")
    public String index(Model m){
        m.addAttribute("Name","Rafaa");
        return "nameDisplayer";
    }



}
