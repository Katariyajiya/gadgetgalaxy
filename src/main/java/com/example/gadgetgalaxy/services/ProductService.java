package com.example.gadgetgalaxy.services;

import com.example.gadgetgalaxy.dto.PageableResponse;
import com.example.gadgetgalaxy.dto.ProductDto;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ProductService {
    ProductDto create(ProductDto productDto);
    ProductDto update(ProductDto productDto,String productId);
    void deleteProduct(String productId);
    PageableResponse<ProductDto> getAllProduct(int pageNumber,int pageSize,String sortBy,String sortDir);
    ProductDto getSingleProduct(String userId);
    PageableResponse<ProductDto> searchByTitle(String subTitle,int pageNumber,int pageSize,String sortBy,String sortDir);
    PageableResponse<ProductDto> isLive(int pageNumber,int pageSize,String sortBy,String sortDir);

}
