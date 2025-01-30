package vn.hieupham.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hieupham.laptopshop.domain.Cart;
import vn.hieupham.laptopshop.domain.CartDetail;
import vn.hieupham.laptopshop.domain.Product;

@Repository
public interface DetailCartRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);
}
