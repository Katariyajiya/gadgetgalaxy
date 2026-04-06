package com.example.gadgetgalaxy.dto;

import com.example.gadgetgalaxy.entities.CartItem;
import com.example.gadgetgalaxy.entities.User;
import jakarta.persistence.CascadeType;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartDto {
    private String cartId;
    private Date createdAt;
    private UserDto userDto;
    private List<CartItemDto> items = new ArrayList<>();

}
