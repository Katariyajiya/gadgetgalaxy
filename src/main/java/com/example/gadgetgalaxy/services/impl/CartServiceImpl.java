package com.example.gadgetgalaxy.services.impl;

import com.example.gadgetgalaxy.dto.AddItemToCartRequest;
import com.example.gadgetgalaxy.dto.CartDto;
import com.example.gadgetgalaxy.entities.Cart;
import com.example.gadgetgalaxy.entities.CartItem;
import com.example.gadgetgalaxy.entities.Product;
import com.example.gadgetgalaxy.entities.User;
import com.example.gadgetgalaxy.exception.ResourceNotFoundException;
import com.example.gadgetgalaxy.repositories.CartRepository;
import com.example.gadgetgalaxy.repositories.ProductRepository;
import com.example.gadgetgalaxy.repositories.UserRepository;
import com.example.gadgetgalaxy.services.CartService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    ProductRepository productRepository;
    @Autowired
    UserRepository userRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    ModelMapper mapper;

    @Override
    public CartDto addItemToCart(String userId, AddItemToCartRequest request) {

        int quantity = request.getQuantity();
        String productId = request.getProductId();

        Product product = productRepository.findById(productId).orElseThrow(() -> new ResourceNotFoundException("Product Not Found in database"));
        User user = userRepository.findById(userId).orElseThrow(()-> new ResourceNotFoundException());

        Cart cart = null;

        try {
            cart = cartRepository.findByUser(user).get();
        }catch (NoSuchElementException e){
            cart = new Cart();
            cart.setCartId(UUID.randomUUID().toString());
            cart.setCreatedAt(new Date());
        }

        AtomicReference<Boolean> updated = new AtomicReference<>(false);
        List<CartItem> items = cart.getItems();

        //if an item in cart already present which we are adding
        List<CartItem> updatedItemList = items.stream().map(item -> {
           if (item.getProduct().getProductId().equals(productId)){
               item.setQuantity(quantity);
               item.setTotalPrice(quantity*product.getPrice());
                updated.set(true);
           }
           return item;
        }).collect(Collectors.toList());

       if (!updated.get()){
           CartItem cartItem = CartItem.builder()
                   .quantity(quantity)
                   .totalPrice(quantity * product.getPrice())
                   .cart(cart)
                   .product(product)
                   .build();
           cart.getItems().add(cartItem);
       }

        cart.setUser(user);
        Cart updatedCart = cartRepository.save(cart);
        return mapper.map(updatedCart,CartDto.class);

    }

    @Override
    public void removeItemToCart(String userId, int cartItem) {

    }

    @Override
    public void clearCart(String userId) {

    }
}
