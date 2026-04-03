package com.example.gadgetgalaxy.validation;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Target({ElementType.FIELD,ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = ImageNameValidator.class)
public @interface  ImageNameValid {
    String message() default "INVALID IMAGE NAME !! ";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
