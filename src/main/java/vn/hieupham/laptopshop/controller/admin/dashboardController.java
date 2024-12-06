package vn.hieupham.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class dashboardController {
    @GetMapping("/admin")
    public String getDashboard(){
        return "admin/dashboard/show";
    }
}
