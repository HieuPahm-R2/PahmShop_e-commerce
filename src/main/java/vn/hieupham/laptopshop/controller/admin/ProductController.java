package vn.hieupham.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hieupham.laptopshop.domain.Product;
import vn.hieupham.laptopshop.service.ProductService;
import vn.hieupham.laptopshop.service.UploadService;

@Controller
public class ProductController {
    //Dependency Injection
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService){
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model){
        List<Product> prs = this.productService.fetchProducts();
        model.addAttribute("products", prs);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model){
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }
     //Show detail product
   @GetMapping("/admin/product/{id}")
   public String getProductDetailPage(Model model, @PathVariable long id){
    Product pr = this.productService.fetchProductById(id).get();
    model.addAttribute("product", pr);
    model.addAttribute("id", id);
    return "admin/product/detail";
   }

    @PostMapping("/admin/product/create")
    public String handleCreateProduct(@ModelAttribute("newProduct") @Valid Product pr,
    BindingResult newProductBindingResult, @RequestParam("hieuFile") MultipartFile file){
        //validate
        if(newProductBindingResult.hasErrors()) return "admin/product/create";

        String image = this.uploadService.handleSaveUploadFile(file, "product");
        pr.setImage(image);
        this.productService.createProduct(pr);
        return "redirect:/admin/product";
    }

    //Update Info Product
   @GetMapping("/admin/product/update/{id}")
   public String getUpdateProductPage(Model model, @PathVariable long id){
     Optional<Product> currentProduct = this.productService.fetchProductById(id);
     model.addAttribute("newProduct", currentProduct.get());
     return "admin/product/update";
   }
   @PostMapping("/admin/product/update")
   public String handleUpdateProduct(@ModelAttribute("newProduct") @Valid Product pr,
   BindingResult newProductBindingResult, @RequestParam("hieuFile") MultipartFile file){
            //validate
    if(newProductBindingResult.hasErrors()){
        return "admin/product/update";
    }
            //logic update
    Product currentProduct = this.productService.fetchProductById(pr.getId()).get();
    if(currentProduct != null){
        if(!file.isEmpty()){
            String img = this.uploadService.handleSaveUploadFile(file, "product");
            currentProduct.setImage(img);
        }
        currentProduct.setName(pr.getName());
        currentProduct.setPrice(pr.getPrice());
        currentProduct.setDetailDesc(pr.getDetailDesc());
        currentProduct.setShortDesc(pr.getShortDesc());
        currentProduct.setFactory(pr.getFactory());
        currentProduct.setQuantity(pr.getQuantity());
        currentProduct.setTarget(pr.getTarget());
            //save
        this.productService.createProduct(currentProduct);
    }
        return "redirect:/admin/product";
   }

    //Delete
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id){
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }
   @PostMapping("/admin/product/delete")
   public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product pr){
    this.productService.deleteProduct(pr.getId());
    return "redirect:/admin/product";
   }

}
