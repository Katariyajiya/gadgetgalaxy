package com.example.gadgetgalaxy.controller;

import com.example.gadgetgalaxy.dto.CategoryDto;
import com.example.gadgetgalaxy.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

//    @PostMapping("/add")
//    public ResponseEntity<CategoryDto> createCategory(){
//
//    }
}
