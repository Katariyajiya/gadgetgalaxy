package com.example.gadgetgalaxy.entities;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class User
{
    @Id
   // @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;


    @Column(name = "user_name")
    private String name;

    @Column(name = "user_email",unique = true)
    private String email;

    @Column(name = "uer_password",length = 10)
    private String password;

    @Column(name = "user_gender",length = 6)
    private String gender;

    @Column(name = "user_about",length = 2000)
    private String about;

    @Column(name = "user_image_name")
    private String imageName;
}
