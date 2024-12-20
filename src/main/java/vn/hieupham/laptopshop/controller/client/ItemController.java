package vn.hieupham.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hieupham.laptopshop.domain.Product;
import vn.hieupham.laptopshop.service.ProductService;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id){
        Product pr = this.productService.findById(id);
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "client/product/detail";
    }
}
