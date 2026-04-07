package com.example.gadgetgalaxy.services.impl;

import com.example.gadgetgalaxy.dto.AddItemToCartRequest;
import com.example.gadgetgalaxy.dto.CartDto;
import com.example.gadgetgalaxy.dto.UserDto;
import com.example.gadgetgalaxy.entities.Cart;
import com.example.gadgetgalaxy.entities.CartItem;
import com.example.gadgetgalaxy.entities.Product;
import com.example.gadgetgalaxy.entities.User;
import com.example.gadgetgalaxy.exception.BadApiRequest;
import com.example.gadgetgalaxy.exception.ResourceNotFoundException;
import com.example.gadgetgalaxy.repositories.CartItemRepository;
import com.example.gadgetgalaxy.repositories.CartRepository;
import com.example.gadgetgalaxy.repositories.ProductRepository;
import com.example.gadgetgalaxy.repositories.UserRepository;
import com.example.gadgetgalaxy.services.CartService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
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
    CartItemRepository cartItemRepository;

    @Autowired
    ModelMapper mapper;

    @Override
    public CartDto addItemToCart(String userId, AddItemToCartRequest request) {

        int quantity = request.getQuantity();
        String productId = request.getProductId();

        if (quantity<=0){
            throw  new BadApiRequest("Requested quantity is not valid");
        }

        Product product = productRepository.findById(productId).orElseThrow(() -> new ResourceNotFoundException("Product Not Found in database"));
        User user = userRepository.findById(userId).orElseThrow(()-> new ResourceNotFoundException());

        Cart cart;

        try {
            cart = cartRepository.findByUser(user).get();
        }catch (NoSuchElementException e){
            cart = new Cart();
            cart.setCartId(UUID.randomUUID().toString());
            cart.setCreatedAt(new Date());
            cart.setItems(new ArrayList<>());
        }

       // AtomicReference<Boolean> updated = new AtomicReference<>(false);
        List<CartItem> items = cart.getItems();
        boolean itemAlreadyExists = false;

        for (CartItem item : items) {
            if (item.getProduct().getProductId().equals(productId)){
                item.setQuantity(item.getQuantity()+quantity);
                item.setTotalPrice(item.getQuantity()*product.getDiscountedPrice());
                itemAlreadyExists=true;
                break;
            }
        }

//        //if an item in cart already present which we are adding
//        List<CartItem> updatedItemList = items.stream().map(item -> {
//           if (item.getProduct().getProductId().equals(productId)){
//               item.setQuantity(quantity);
//               item.setTotalPrice(quantity*product.getDiscountedPrice());
//                updated.set(true);
//           }
//           return item;
//        }).collect(Collectors.toList());
//
//        cart.setItems(updatedItemList);
//
       if (!itemAlreadyExists){
           CartItem newCartItem = CartItem.builder()
                   .quantity(quantity)
                   .totalPrice(quantity * product.getPrice())
                   .cart(cart)
                   .product(product)
                   .build();
           items.add(newCartItem);
       }
//
//        cart.setUser(user);
//
        Cart updatedCart = cartRepository.save(cart);
       return mapper.map(updatedCart,CartDto.class);

    }

    @Override
    public void removeItemToCart(String userId, int cartItem) {


        CartItem cartItem1 = cartItemRepository.findById(cartItem).orElseThrow(() -> new ResourceNotFoundException("CartItem not found"));
        cartItemRepository.delete(cartItem1);
    }

    @Override
    public void clearCart(String userId) {

        User user = userRepository.findById(userId).orElseThrow(()-> new ResourceNotFoundException());
        Cart cart = cartRepository.findByUser(user).orElseThrow(() -> new ResourceNotFoundException());
        cart.getItems().clear();
        cartRepository.save(cart);
    }

    @Override
    public CartDto getCartByUser(String userId) {
        User user = userRepository.findById(userId).orElseThrow(()-> new ResourceNotFoundException());
        Cart cart = cartRepository.findByUser(user).orElseThrow(() -> new ResourceNotFoundException());
        return mapper.map(cart,CartDto.class);
    }
}
