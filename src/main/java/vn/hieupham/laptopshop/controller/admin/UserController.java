package vn.hieupham.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.repository.UserRepository;
import vn.hieupham.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;






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
        return "admin/user/show";
    }
    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model){
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }
    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id){
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id",id);
        return "admin/user/detail";
    }
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User hieupham){
        this.userService.handleUserSave(hieupham);
        return "redirect:/admin/user";
    }
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id){
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User hieupham){
        User currentUser = this.userService.getUserById(hieupham.getId());
        if(currentUser != null){
            currentUser.setAddress(hieupham.getAddress());
            currentUser.setFullName(hieupham.getFullName());
            currentUser.setPhone(hieupham.getPhone());
            this.userService.handleUserSave(currentUser);
        }
        return "redirect:/admin/user";
    }
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }
    @PostMapping("admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User hieupham) {
        //TODO: process POST request
        this.userService.deleteAUser(hieupham.getId());
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
