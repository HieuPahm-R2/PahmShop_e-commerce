package vn.hieupham.laptopshop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import vn.hieupham.laptopshop.domain.Product;
import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.domain.dto.RegisterDTO;
import vn.hieupham.laptopshop.service.ProductService;
import vn.hieupham.laptopshop.service.UserService;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService,UserService userService,
    PasswordEncoder passwordEncoder){
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model){
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> products = prs.getContent();
        model.addAttribute("products", products);
        return "client/home/show";
    }
    //register
    @GetMapping("/register")
    public String getRegisterPage(Model model){
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }
    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO
    ,BindingResult bindingResult){
        //validate
        if(bindingResult.hasErrors()){
            return "client/auth/register";
        }
        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        //save
        this.userService.handleUserSave(user);
        return "redirect:/login";
    }
    @GetMapping("/login")
    public String getLoginPage(Model model){
        return "client/auth/login";
    }
    @GetMapping("/accessDenied")
    public String getDenyPage(Model model){
        return "client/auth/accessDeny";
    }
}
