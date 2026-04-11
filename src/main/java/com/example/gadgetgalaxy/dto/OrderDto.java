package com.example.gadgetgalaxy.dto;

import com.example.gadgetgalaxy.entities.OrderItem;
import com.example.gadgetgalaxy.entities.User;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class OrderDto {
    private String orderId;
    private String orderStatus="PENDING";
    private String paymentStatus="NOT_PAID";
    private int orderAmount;
    private String billingAddress;
    private String billingPhone;
    private String billingName;
    private Date orderDate=new Date();
    private Date deliveryDate;
    //private User user;
    private List<OrderItemDto> orderItems = new ArrayList<>();
}
