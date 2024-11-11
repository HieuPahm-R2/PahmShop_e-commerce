package vn.hoidanit.laptopshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloControl {
    @GetMapping("/")
    public String index(){
        return "Konichiwa";
    }
    @GetMapping("/user")
    public String userPage(){
        return "This page is only for user access";
    }
    @GetMapping("/admin")
    public String adminPage(){
        return "Ohaiyo, Administrator";
    }
}
