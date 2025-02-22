package vn.hieupham.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hieupham.laptopshop.domain.Role;
import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.domain.dto.RegisterDTO;
import vn.hieupham.laptopshop.repository.OrderRepository;
import vn.hieupham.laptopshop.repository.ProductRepository;
import vn.hieupham.laptopshop.repository.RoleRepository;
import vn.hieupham.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    public final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository,
    ProductRepository productRepository,OrderRepository orderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
    }
    public String handleHello(){
        return "hello from service with love";
    }

    public List<User> getAllUsers(){
        return this.userRepository.findAll();
    }
    public List<User> getAllUsersByEmail(String email){
        return this.userRepository.findOneByEmail(email);
    }
    public User handleUserSave(User user){
        User hieu = this.userRepository.save(user);
        return hieu;
    }
    public User getUserById(long id){
        return this.userRepository.findById(id);
    }
    public void deleteAUser(long id){
         this.userRepository.deleteById(id);
    }
    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    }

    //Dto register
    public User registerDTOtoUser(RegisterDTO registerDTO){
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }
    public Boolean checkEmailExist(String email){
        return this.userRepository.existsByEmail(email);
    }
    //login
    public User getUserByEmail(String email){
        return this.userRepository.findByEmail(email);
    }

    public long countOrders(){
        return this.orderRepository.count();
    }
    public long countProducts(){
        return this.productRepository.count();
    }
    public long countUsers(){
        return this.userRepository.count();
    }
}
