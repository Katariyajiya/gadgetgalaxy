package com.example.gadgetgalaxy.dto;


import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.util.Date;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateOrderRequest {
    @NotBlank(message = "user id is required")
    private String userId;
    @NotBlank(message = "Cart id is required")
    private String cartId;

    private String orderStatus="PENDING";
    private String paymentStatus="NOTPAID";

    @NotBlank(message = "address is required")
    private String billingAddress;
    @NotBlank(message = "phone is required")
    private String billingPhone;
    @NotBlank(message = "biling name  is required")
    private String billingName;
}
