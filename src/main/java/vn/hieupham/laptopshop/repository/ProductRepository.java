package vn.hieupham.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hieupham.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

}