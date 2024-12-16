package vn.hieupham.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hieupham.laptopshop.domain.Product;
import vn.hieupham.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository){
        this.productRepository = productRepository;
    }
    public Product createProduct(Product pr){
        return this.productRepository.save(pr);
    }
    public List<Product> fetchProducts(){
        return this.productRepository.findAll();
    }

    //Xoa
    public void deleteProduct(long id){
        this.productRepository.deleteById(id);
    }
    //hien thi chi tiet
    public Optional<Product> fetchProductById(long id){
        return this.productRepository.findById(id);
    }
}
