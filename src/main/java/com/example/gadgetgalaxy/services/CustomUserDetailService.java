package com.example.gadgetgalaxy.services;

import com.example.gadgetgalaxy.entities.User;
import com.example.gadgetgalaxy.exception.ResourceNotFoundException;
import com.example.gadgetgalaxy.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    User user;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        System.out.println("LOGIN USERNAME: " + username);
       // System.out.println("DB PASSWORD: " + user.getPassword());

        User user = userRepository.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        System.out.println("DB USER: " + user);// debug
        System.out.println("DB PASSWORD: " + user.getPassword());
        return user;
    }
}
//$2a$10$aRNhDYoQ9Ylq1KhM5LFyhu2D82eYG5W/0R5/4igeoDfUTig7e/TaS
