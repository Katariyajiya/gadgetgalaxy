package com.example.gadgetgalaxy.dto;

import com.example.gadgetgalaxy.entities.Role;
import com.example.gadgetgalaxy.validation.ImageNameValid;
import jakarta.persistence.Column;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class UserDto {
    private String userId;

    @Size(min = 3,max = 15,message = "Invalid name not in valid range")
    private String name;

  //  @Email(message = "Invalid email!")
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",message = "INVALID USER EMAIL")
    private String email;

    @NotBlank(message = "Password is required")
    private String password;

    @Size(min = 3,max = 6,message = "Invalid gender")
    private String gender;

    @NotBlank(message = "about can't be null add somthing about youself")
    private String about;

    @ImageNameValid
    private String imageName;

    private Set<RoleDto> roles = new HashSet<>();
}
