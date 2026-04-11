package com.example.gadgetgalaxy.repositories;

import com.example.gadgetgalaxy.entities.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem,String> {

}
