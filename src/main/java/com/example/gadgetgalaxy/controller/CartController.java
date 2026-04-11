package com.example.gadgetgalaxy.controller;

import com.example.gadgetgalaxy.dto.AddItemToCartRequest;
import com.example.gadgetgalaxy.dto.ApiResponseMessage;
import com.example.gadgetgalaxy.dto.CartDto;
import com.example.gadgetgalaxy.services.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CartService cartService;

    @PostMapping("/{userId}")
    public ResponseEntity<CartDto> addItemToCart(@PathVariable String userId,@RequestBody AddItemToCartRequest request){
        CartDto cartDto = cartService.addItemToCart(userId,request);
        return new ResponseEntity<>(cartDto, HttpStatus.OK);
    }

    @DeleteMapping("/{userId}/items/{cartItem}")
    public ResponseEntity<ApiResponseMessage> removeItemFromCart(
            @PathVariable String userId,
            @PathVariable int cartItem
            ){

        System.out.println("API HIT: DELETE CART ITEM");
        System.out.println("UserId: " + userId + " CartItem: " + cartItem);

       // cartService.removeItemToCart(userId,cartItem);
          cartService.removeItemToCart(userId,cartItem);
        ApiResponseMessage message = ApiResponseMessage.builder()
                .message("Item removed from cart succsfully")
                .status(HttpStatus.OK)
                .success(true)
                .build();

        return new ResponseEntity<>(message,HttpStatus.OK);
    }

    @DeleteMapping("/clear/{userId}")
    public ResponseEntity<ApiResponseMessage> clearCart(@PathVariable String userId){
        cartService.clearCart(userId);
        ApiResponseMessage message = ApiResponseMessage.builder()
                .message("Cart Cleared successfully")
                .success(true)
                .status(HttpStatus.OK)
                .build();

        return new ResponseEntity<>(message,HttpStatus.OK);
    }

    @GetMapping("/{userId}")
    public ResponseEntity<CartDto> getCartItems(@PathVariable String userId){
        CartDto cartItems = cartService.getCartByUser(userId);
        return new ResponseEntity<>(cartItems,HttpStatus.OK);
    }
}
