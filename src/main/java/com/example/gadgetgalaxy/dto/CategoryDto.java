package com.example.gadgetgalaxy.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CategoryDto {

    private String categoryId;

    @NotBlank
    @Size(min = 4,message = "Must be atleast 4 characters")
    private String title;

    @NotBlank(message = "Description is required")
    private String description;


    private String coverImage;
}
