package com.example.gadgetgalaxy.controller;

import com.example.gadgetgalaxy.dto.ApiResponseMessage;
import com.example.gadgetgalaxy.dto.PageableResponse;
import com.example.gadgetgalaxy.dto.ProductDto;
import com.example.gadgetgalaxy.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService productService;

    @PostMapping("/create")
    public ResponseEntity<ProductDto> createProduct(@RequestBody ProductDto productDto){
       String id = UUID.randomUUID().toString();
        productDto.setProductId(id);
        ProductDto productDto1 = productService.create(productDto);
        return new ResponseEntity<>(productDto1, HttpStatus.CREATED);
    }

    @PutMapping("/update/{productId}")
    public ResponseEntity<ProductDto> updateProduct(
            @PathVariable String productId,
            @RequestBody ProductDto productDto
    ){
        ProductDto updatedProduct = productService.update(productDto, productId);
        return new ResponseEntity<>(updatedProduct,HttpStatus.OK);
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<ApiResponseMessage> delete(@PathVariable String productId){
        productService.deleteProduct(productId);
        ApiResponseMessage message = ApiResponseMessage
                .builder()
                .message("Product deleted successfuly")
                .success(true)
                .status(HttpStatus.OK)
                .build();
        return new ResponseEntity<>(message,HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<PageableResponse<ProductDto>> getAllProduct(
            @RequestParam(value = "pageNumber",defaultValue = "0",required = false) int pageNumber,
            @RequestParam(value = "pageSize",defaultValue = "10",required = true) int pageSize,
            @RequestParam(value = "sortBy",defaultValue = "name",required = false) String sortBy,
            @RequestParam(value = "sortDir",defaultValue = "ASC",required = true) String sortDir
    ){
        return new ResponseEntity<>(productService.getAllProduct(pageNumber, pageSize, sortBy, sortDir),HttpStatus.OK);
    }

    @GetMapping("/live")
    public ResponseEntity<PageableResponse<ProductDto>> getLiveProduct(
            @RequestParam(value = "pageNumber",defaultValue = "0",required = false) int pageNumber,
            @RequestParam(value = "pageSize",defaultValue = "10",required = true) int pageSize,
            @RequestParam(value = "sortBy",defaultValue = "live",required = false) String sortBy,
            @RequestParam(value = "sortDir",defaultValue = "ASC",required = true) String sortDir
    ){
        return new ResponseEntity<>(productService.isLive(pageNumber, pageSize, sortBy, sortDir),HttpStatus.OK);
    }
    @GetMapping("/search/{subTitle}")
    public ResponseEntity<PageableResponse<ProductDto>> searchProduct(
            @RequestParam(value = "pageNumber",defaultValue = "0",required = false) int pageNumber,
            @RequestParam(value = "pageSize",defaultValue = "10",required = true) int pageSize,
            @RequestParam(value = "sortBy",defaultValue = "title",required = false) String sortBy,
            @RequestParam(value = "sortDir",defaultValue = "ASC",required = true) String sortDir,
            @PathVariable String subTitle
    ){
        return new ResponseEntity<>(productService.searchByTitle(subTitle,pageNumber, pageSize, sortBy, sortDir),HttpStatus.OK);
    }

    @GetMapping("/{productId}")
    public ResponseEntity<ProductDto> getSingleProduct(@PathVariable String productId){
        ProductDto singleProduct = productService.getSingleProduct(productId);
        return new ResponseEntity<>(singleProduct,HttpStatus.FOUND);
    }

}
