package vn.hieupham.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.repository.UserRepository;
import vn.hieupham.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class UserController{

    private final UserService userService; 

    public UserController(UserService userService){
        this.userService = userService;
    }
    @RequestMapping("/")
    public String getHomePage(Model model){
        List<User> arrUsers = this.userService.getAllUsersByEmail("hieupham@gmail.com");
        model.addAttribute("pham","t");
        model.addAttribute("trun", "yess sirr");
        return "hi";
    }
    @RequestMapping("/admin/user")
    public String getUserPage(Model model){
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/table-user";
    }
    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model){
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User hieupham){
        this.userService.handleUserSave(hieupham);
        return "redirect:/admin/user";
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
