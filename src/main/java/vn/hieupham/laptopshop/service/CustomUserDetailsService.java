package vn.hieupham.laptopshop.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class CustomUserDetailsService implements UserDetailsService {
    //DI
    private final UserService userService;
    public CustomUserDetailsService(UserService userService){
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        vn.hieupham.laptopshop.domain.User user = this.userService.getUserByEmail(username);
        if(user == null){
            throw new UsernameNotFoundException("user not found");
        }
        return new User(
            user.getEmail(),user.getPassword(),
            Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"))
        );
        //logic to do
        
    }
    
}