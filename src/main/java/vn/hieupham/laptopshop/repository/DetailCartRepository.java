package vn.hieupham.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.hieupham.laptopshop.domain.CartDetail;

@Repository
public interface DetailCartRepository extends JpaRepository<CartDetail, Long> {

}
