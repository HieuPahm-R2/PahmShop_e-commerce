package vn.hieupham.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hieupham.laptopshop.domain.User;
import vn.hieupham.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    public String handleHello(){
        return "hello from service with love";
    }

    public List<User> getAllUsers(){
        return this.userRepository.findAll();
    }
    public List<User> getAllUsersByEmail(String email){
        return this.userRepository.findByEmail(email);
    }
    public User handleUserSave(User user){
        return this.userRepository.save(user);
    }
}
