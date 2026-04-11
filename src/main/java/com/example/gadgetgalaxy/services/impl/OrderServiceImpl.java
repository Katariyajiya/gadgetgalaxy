package com.example.gadgetgalaxy.services.impl;

import com.example.gadgetgalaxy.dto.CreateOrderRequest;
import com.example.gadgetgalaxy.dto.OrderDto;
import com.example.gadgetgalaxy.dto.PageableResponse;
import com.example.gadgetgalaxy.entities.*;
import com.example.gadgetgalaxy.exception.BadApiRequest;
import com.example.gadgetgalaxy.exception.ResourceNotFoundException;
import com.example.gadgetgalaxy.helper.Helper;
import com.example.gadgetgalaxy.repositories.CartRepository;
import com.example.gadgetgalaxy.repositories.OrderRepository;
import com.example.gadgetgalaxy.repositories.UserRepository;
import com.example.gadgetgalaxy.services.OrderService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ModelMapper mapper;
    @Override
    public OrderDto createOrder(CreateOrderRequest orderRequest) {
        String userId = orderRequest.getUserId();
        String cartId = orderRequest.getCartId();
        User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User not found by given id"));
        Cart cart = cartRepository.findById(cartId).orElseThrow(() -> new ResourceNotFoundException("cart with given id not found"));

        List<CartItem> cartItems = cart.getItems();

        if (cartItems.size()<=0){
            throw new BadApiRequest("Cart is empty can't place order");
        }
        Order order = Order.builder()
                .billingName(orderRequest.getBillingName())
                .billingAddress(orderRequest.getBillingAddress())
                .billingPhone(orderRequest.getBillingPhone())
                .orderDate(new Date())
                .deliveryDate(null)
                .paymentStatus(orderRequest.getPaymentStatus())
                .orderStatus(orderRequest.getOrderStatus())
                .orderId(UUID.randomUUID().toString())
                .user(user)
                .build();

        AtomicReference<Integer> orderAmount = new AtomicReference<>(0);
        List<OrderItem> orderItems = cartItems.stream().map(cartItem -> {
            OrderItem orderItem = OrderItem.builder()
                    .quantity(cartItem.getQuantity())
                    .product(cartItem.getProduct())
                    .totalPrice(cartItem.getQuantity() * cartItem.getProduct().getDiscountedPrice())
                    .order(order)
                    .build();

            orderAmount.set(orderAmount.get()+orderItem.getTotalPrice());
            return orderItem;
        }).collect(Collectors.toList());
        order.setOrderAmount(orderAmount.get());
        order.setOrderItems(orderItems);

        cart.getItems().clear();
        cartRepository.save(cart);
        Order savedOrder = orderRepository.save(order);
        return mapper.map(savedOrder,OrderDto.class);

    }

    @Override
    public void removeOrder(String orderId) {
        Order order = orderRepository.findById(orderId).orElseThrow(() -> new ResourceNotFoundException("order with given id not found"));
        orderRepository.delete(order);
    }

    @Override
    public List<OrderDto> getOrderOfUser(String userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException());
        System.out.println("USER FOUND");
        List<Order> orderList = orderRepository.findByUser(user);
        List<OrderDto> orderDtos = orderList.stream().map(
                (order) -> mapper.map(order, OrderDto.class)
        ).collect(Collectors.toList());
        return orderDtos;
    }

    @Override
    public PageableResponse<OrderDto> getOrders(int pageNumber, int pageSize, String sortBy, String sortDir) {

        Sort sort = (sortDir.equalsIgnoreCase("desc")) ? (Sort.by(sortBy).descending()) : (Sort.by(sortBy).ascending());
        Pageable pageable = PageRequest.of(pageNumber,pageSize,sort);
        Page<Order> page = orderRepository.findAll(pageable);
        return Helper.getPageableResponse(page,OrderDto.class);
    }
}
