package vn.hieupham.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hieupham.laptopshop.domain.Cart;
import vn.hieupham.laptopshop.domain.CartDetail;
import vn.hieupham.laptopshop.domain.Product;
import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.repository.CartRepository;
import vn.hieupham.laptopshop.repository.DetailCartRepository;
import vn.hieupham.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
   
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final DetailCartRepository detailCartRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
    DetailCartRepository detailCartRepository, UserService userService){
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.detailCartRepository = detailCartRepository;
        this.userService = userService;
    }
    public Product createProduct(Product pr){
        Product luu = this.productRepository.save(pr);
        return luu;
    }
    public List<Product> fetchProducts(){
        return this.productRepository.findAll();
    }
    public Optional<Product> fetchProductById(long id){
        return this.productRepository.findById(id);
    }

    //Xoa
    public void deleteProduct(long id){
        this.productRepository.deleteById(id);
    }
   
    /** CART Module */
    public void handleAddProductToCart(String email, long ProductId){
     
        User user = userService.getUserByEmail(email);
        if(user != null){
            // let's check user have cart yet??
            Cart cart = cartRepository.findByUser(user);
            if(cart == null){
                //create new cart
                Cart latestCart = new Cart();
                latestCart.setUser(user);
                latestCart.setSum(1);
                cart = this.cartRepository.save(latestCart);

            }
            Optional<Product> productNext = this.productRepository.findById(ProductId);
            if(productNext.isPresent()){
                Product realProduct = productNext.get();
                CartDetail cd = new CartDetail();
                cd.setCart(cart);
                cd.setProduct(realProduct);
                cd.setPrice(realProduct.getPrice());
                cd.setQuantity(1);
                this.detailCartRepository.save(cd);
            }
            
        }
    }
}
