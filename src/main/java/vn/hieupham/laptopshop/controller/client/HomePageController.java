package vn.hieupham.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hieupham.laptopshop.domain.Product;
import vn.hieupham.laptopshop.service.ProductService;

@Controller
public class HomePageController {
    private final ProductService productService;

    public HomePageController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model){
        List<Product> products = this.productService.fetchProducts();
        model.addAttribute("products", products);
        return "/client/home/show";
    }
}
