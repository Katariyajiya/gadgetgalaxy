package com.example.gadgetgalaxy.repositories;

import com.example.gadgetgalaxy.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category,String> {
}
