package com.example.gadgetgalaxy.services;

import com.example.gadgetgalaxy.dto.AddItemToCartRequest;
import com.example.gadgetgalaxy.dto.CartDto;

public interface CartService {

    CartDto addItemToCart(String userId, AddItemToCartRequest request);
    void removeItemToCart(String userId,int cartItem);
    void clearCart(String userId);
    CartDto getCartByUser(String userId);

}
