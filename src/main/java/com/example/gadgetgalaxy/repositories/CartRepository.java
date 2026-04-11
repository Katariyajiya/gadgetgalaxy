package com.example.gadgetgalaxy.repositories;

import com.example.gadgetgalaxy.entities.Cart;
import com.example.gadgetgalaxy.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CartRepository extends JpaRepository<Cart,String> {
 Optional<Cart> findByUser(User user);
}
