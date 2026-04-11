package com.example.gadgetgalaxy.config;

import com.example.gadgetgalaxy.dto.CartDto;
import com.example.gadgetgalaxy.dto.CartItemDto;
import com.example.gadgetgalaxy.entities.Cart;
import com.example.gadgetgalaxy.entities.CartItem;
import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ProjectConfig {

    @Bean
    public ModelMapper modelMapper() {
        ModelMapper mapper = new ModelMapper();

        // Cart → CartDto mapping
        mapper.typeMap(Cart.class, CartDto.class).addMappings(m -> {
            m.map(Cart::getUser, CartDto::setUserDto);
        });

        // CartItem → CartItemDto mapping
        mapper.typeMap(CartItem.class, CartItemDto.class).addMappings(m -> {
            m.map(CartItem::getProduct, CartItemDto::setProductDto);
        });

        return mapper;
    }
}
