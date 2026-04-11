package com.example.gadgetgalaxy.services;

import com.example.gadgetgalaxy.dto.CreateOrderRequest;
import com.example.gadgetgalaxy.dto.OrderDto;
import com.example.gadgetgalaxy.dto.PageableResponse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderService {
     OrderDto createOrder(CreateOrderRequest orderRequest);
     void removeOrder(String orderId);
     List<OrderDto> getOrderOfUser(String userId);
     PageableResponse<OrderDto> getOrders(int pageNumber,int pageSize,String sortBy,String sortDir);
}
