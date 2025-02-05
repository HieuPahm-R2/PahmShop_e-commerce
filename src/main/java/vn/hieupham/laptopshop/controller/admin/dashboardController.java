package vn.hieupham.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hieupham.laptopshop.service.UserService;



@Controller
public class dashboardController {
    //DI
    private final UserService userService;

    public dashboardController(UserService userService){
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model){
        model.addAttribute("countOrders", this.userService.countOrders());
        model.addAttribute("countProducts", this.userService.countProducts());
        model.addAttribute("countUsers", this.userService.countUsers());
        return "admin/dashboard/show";
    }
}
