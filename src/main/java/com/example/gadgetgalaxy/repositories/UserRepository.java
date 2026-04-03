package com.example.gadgetgalaxy.repositories;

import com.example.gadgetgalaxy.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User,String> {
    // Optional<User> findById(String userId);
    Optional<User> findByEmail(String email);
    List<User> findByNameContaining(String keyword);
}
