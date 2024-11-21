package vn.hieupham.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.ui.Model;
import vn.hieupham.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class UserController{

    private UserService userService;
    public UserController(UserService userService){
        this.userService = userService;
    }
    @RequestMapping("/")
    public String getHomePage(Model model){
        String t = this.userService.handleHello();
        model.addAttribute("pham",t);
        model.addAttribute("trun", "yess sirr");
        return "hi";
    }
    
}

// @RestController
// public class UserController {
//    private UserService userService;
   
//     //DI : Dependency injection
//     public UserController(UserService userService) {
//     this.userService = userService;
// }

//     @GetMapping(" ")
//     public String getHomePage(){
//         return this.userService.handleHello();
//     }
// }
