package vn.hieupham.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
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
    public void handleAddProductToCart(String email, long ProductId, HttpSession session){
     
        User user = userService.getUserByEmail(email);
        if(user != null){
            // let's check user have cart yet??
            Cart cart = cartRepository.findByUser(user);
            if(cart == null){
                //create new cart
                Cart latestCart = new Cart();
                latestCart.setUser(user);
                latestCart.setSum(0);
                cart = this.cartRepository.save(latestCart);

            }
            Optional<Product> productNext = this.productRepository.findById(ProductId);
            if(productNext.isPresent()){
                Product realProduct = productNext.get();
                CartDetail lastDetail = this.detailCartRepository.findByCartAndProduct(cart, realProduct);
                if(lastDetail == null){
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);
                    this.detailCartRepository.save(cd);

                    //Update the sum of product has bought
                    int sumSave = cart.getSum() + 1;
                    cart.setSum(sumSave);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sumSave);
                }else{
                    lastDetail.setQuantity(lastDetail.getQuantity() + 1);
                    this.detailCartRepository.save(lastDetail);
                }
               
            }
            
        }
    }

    public Cart fetchByUser(User user){
        return this.cartRepository.findByUser(user);
    }
    //Delete cart
    public void handleDeleteCart(long cartDetailId, HttpSession session){
        Optional<CartDetail> cartDetailOp = this.detailCartRepository.findById(cartDetailId);
        if(cartDetailOp.isPresent()){
            CartDetail cartDetailNow = cartDetailOp.get();
            Cart currentCart = cartDetailNow.getCart();
            this.detailCartRepository.deleteById(cartDetailId);
            if(currentCart.getSum() > 1){
                int sUp = currentCart.getSum() - 1;
                currentCart.setSum(sUp);
                session.setAttribute("sum", sUp);
                this.cartRepository.save(currentCart);
            }else{
                //delete now
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
                
            }
        }
    }
    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails){
        for(CartDetail cd : cartDetails){
            Optional<CartDetail> cdOptional = this.detailCartRepository.findById(cd.getId());
            if(cdOptional.isPresent()){
                CartDetail curCartDetail = cdOptional.get();
                curCartDetail.setQuantity(cd.getQuantity());
                this.detailCartRepository.save(curCartDetail);
            }
        }
    }
}
    
