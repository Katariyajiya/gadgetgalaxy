package com.example.gadgetgalaxy.repositories;

import com.example.gadgetgalaxy.entities.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartItemRepository extends JpaRepository<CartItem,Integer> {
}
