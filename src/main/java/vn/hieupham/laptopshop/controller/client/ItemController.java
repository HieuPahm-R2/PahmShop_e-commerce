package vn.hieupham.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hieupham.laptopshop.domain.Cart;
import vn.hieupham.laptopshop.domain.CartDetail;
import vn.hieupham.laptopshop.domain.Product;
import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService){
        this.productService = productService;
    }
    //Filter
    @GetMapping("/products")
    public String getProductPage(Model model, @RequestParam("page") Optional<String> pageOptional,
    @RequestParam("name") Optional<String> nameOptional){
        int page = 1;
        try {
            if(pageOptional.isPresent()){
                //convert page from string to integer
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of( page - 1, 3);
        String name = nameOptional.isPresent() ? nameOptional.get() : " ";
        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, name);
        List<Product> products = prs.getContent();
        model.addAttribute("products", products);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("currentPage", page);
        return "client/product/preview";
    }


    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id){
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "client/product/detail";
    }
    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        long ProductId = id;
        String email = (String)session.getAttribute("email");
        
        this.productService.handleAddProductToCart(email, ProductId, session);
        return "redirect:/";
    }
    /** show cart page */
    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request){
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long idUser =(long)session.getAttribute("id");
        currentUser.setId(idUser);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double totalPrice = 0;
        for(CartDetail cd : cartDetails){
            totalPrice += cd.getPrice() * cd.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/viewShow"; 
    }
    /** Delete cart page */
    @PostMapping("/delete-cartProduct/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleDeleteCart(cartDetailId, session);
        return "redirect:/cart";
    }
    /* Checkout */
    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request){
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long idUser =(long)session.getAttribute("id");
        currentUser.setId(idUser);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double totalPrice = 0;
        for(CartDetail cd : cartDetails){
            totalPrice += cd.getPrice() * cd.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
  
        return "client/cart/checkout"; 
    }

    @PostMapping("/confirm-checkout")
    public String getCheckoutPage(@ModelAttribute("cart") Cart cart){
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }
    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request,
                @RequestParam("receiverName") String receiverName,
                @RequestParam("receiverAddress") String receiverAddress,
                @RequestParam("receiverPhone") String receiverPhone){
                
                User currentUser = new User();
                HttpSession session = request.getSession(false);
                long idUser =(long)session.getAttribute("id");
                currentUser.setId(idUser);
                this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
                return "redirect:/successOrder";
    }
    @GetMapping("/successOrder")
    public String getSuccessOrderPage(Model model){
        return "client/cart/allDone";
    }
}
