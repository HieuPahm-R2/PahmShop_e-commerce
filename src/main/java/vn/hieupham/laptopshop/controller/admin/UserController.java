package vn.hieupham.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.repository.UserRepository;
import vn.hieupham.laptopshop.service.UploadService;
import vn.hieupham.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

import org.springframework.web.bind.annotation.GetMapping;




@Controller
public class UserController{

    private final UserService userService; 
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService,UploadService uploadService, PasswordEncoder passwordEncoder){
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
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
    @GetMapping("/admin/user/create")
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
    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
     @ModelAttribute("newUser") User hieupham, 
     @RequestParam("hieuFile") MultipartFile file){
       String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
       String hashPassword = this.passwordEncoder.encode(hieupham.getPassword());

       hieupham.setAvatar(avatar);
       hieupham.setPassword(hashPassword);
       hieupham.setRole(this.userService.getRoleByName(hieupham.getRole().getName()));
       //save
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
