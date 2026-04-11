package com.example.gadgetgalaxy.services.impl;
import com.example.gadgetgalaxy.dto.PageableResponse;
import com.example.gadgetgalaxy.entities.Category;
import com.example.gadgetgalaxy.entities.Product;
import com.example.gadgetgalaxy.dto.ProductDto;
import com.example.gadgetgalaxy.exception.ResourceNotFoundException;
import com.example.gadgetgalaxy.helper.Helper;
import com.example.gadgetgalaxy.repositories.CategoryRepository;
import com.example.gadgetgalaxy.repositories.ProductRepository;
import com.example.gadgetgalaxy.services.ProductService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ProductServiceImpl implements ProductService {


    @Autowired
    ModelMapper mapper;
    @Autowired
    ProductRepository productRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public ProductDto create(ProductDto productDto) {
        Product product = mapper.map(productDto, Product.class);
        Product saved = productRepository.save(product);
        return mapper.map(saved,ProductDto.class);
    }

    @Override
    public ProductDto update(ProductDto productDto, String productId) {
      Product product = productRepository.findById(productId).orElseThrow(()-> new ResourceNotFoundException());
      product.setTitle(productDto.getTitle());
      product.setDescription(productDto.getDescription());
      product.setPrice(productDto.getPrice());
      product.setDiscountedPrice(productDto.getDiscountedPrice());
      product.setQuantity(productDto.getQuantity());
      product.setLive(productDto.isLive());
      product.setStock(productDto.isStock());
      product.setProductImageName(productDto.getProductImageName());


        Product updatedProduct = productRepository.save(product);
        return mapper.map(updatedProduct,ProductDto.class);
    }

    @Override
    public void deleteProduct(String productId) {
        Product product = productRepository.findById(productId).orElseThrow(() -> new ResourceNotFoundException());
        productRepository.delete(product);
    }

    @Override
    public PageableResponse<ProductDto> getAllProduct(int pageNumber,int pageSize,String sortBy,String sortDir) {
        Sort sort = (sortDir.equalsIgnoreCase("desc")) ? (Sort.by(sortBy).descending()):(Sort.by(sortBy).ascending());
        Pageable pageable = PageRequest.of(pageNumber,pageSize);
        Page<Product> page = productRepository.findAll(pageable);
        PageableResponse<ProductDto> pageableResponse = Helper.getPageableResponse(page, ProductDto.class);
        return pageableResponse;
    }

    @Override
    public ProductDto getSingleProduct(String productId) {
        Product product = productRepository.findById(productId).orElseThrow(() -> new ResourceNotFoundException());
        return mapper.map(product,ProductDto.class);
    }

    @Override
    public PageableResponse<ProductDto> isLive(int pageNumber, int pageSize, String sortBy, String sortDir) {
        Sort sort = (sortDir.equalsIgnoreCase("desc")) ? (Sort.by(sortBy).descending()):(Sort.by(sortBy).ascending());
        Pageable pageable = PageRequest.of(pageNumber,pageSize);
        Page<Product> page = productRepository.findByLiveTrue(pageable);
        PageableResponse<ProductDto> pageableResponse = Helper.getPageableResponse(page, ProductDto.class);
        return pageableResponse;
    }
    @Override
    public PageableResponse<ProductDto> searchByTitle(String subTitle,int pageNumber,int pageSize,String sortBy,String sortDir) {
        Pageable pageable = PageRequest.of(pageNumber,pageSize);
        Page<Product> page = productRepository.findByTitleContaining(subTitle,pageable);
        PageableResponse<ProductDto> pageableResponse = Helper.getPageableResponse(page, ProductDto.class);
        return pageableResponse;
    }
    @Override
    public ProductDto createWithCategory(ProductDto productDto, String categoryId) {
        Category category = categoryRepository.findById(categoryId).orElseThrow(() -> new ResourceNotFoundException("category not found"));
        Product product = mapper.map(productDto, Product.class);

        String productId = UUID.randomUUID().toString();
        product.setProductId(productId);
        product.setAddedDate(new Date());
        product.setCategory(category);
        Product savedproduct = productRepository.save(product);

        return mapper.map(savedproduct,ProductDto.class);
    }

    @Override
    public ProductDto updateCategory(String productId, String categoryId) {
        Product product = productRepository.findById(productId).orElseThrow(()-> new ResourceNotFoundException("product with given id not found"));
        Category category = categoryRepository.findById(categoryId).orElseThrow(()-> new ResourceNotFoundException("category with given id not found"));
        product.setCategory(category);
        Product updatedProduct = productRepository.save(product);

        return mapper.map(updatedProduct,ProductDto.class);
    }

    @Override
    public PageableResponse<ProductDto> getAllOfCategory(
             String categoryId,int pageNumber,int pageSize,String sortBy,String sortDir) {
        Sort sort = (sortDir.equalsIgnoreCase("desc")) ? (Sort.by(sortBy).descending()):(Sort.by(sortBy).ascending());
        Pageable pageable = PageRequest.of(pageNumber,pageSize,sort);
        Category category = categoryRepository.findById(categoryId).orElseThrow(()->new ResourceNotFoundException());
        Page<Product> categories = productRepository.findByCategory(category,pageable);
        PageableResponse<ProductDto> pageableResponse = Helper.getPageableResponse(categories, ProductDto.class);
        return pageableResponse;

    }

}
