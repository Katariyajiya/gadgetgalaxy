package com.example.gadgetgalaxy.repositories;

import com.example.gadgetgalaxy.entities.Order;
import com.example.gadgetgalaxy.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order,String> {
    List<Order> findByUser(User user);
}
