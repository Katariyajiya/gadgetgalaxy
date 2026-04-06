package com.example.gadgetgalaxy.dto;

import com.example.gadgetgalaxy.entities.Cart;
import com.example.gadgetgalaxy.entities.Product;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartItemDto {
    private int cartItemId;
    private ProductDto productDto;
    private int quantity;
    private int totalPrice;

}
