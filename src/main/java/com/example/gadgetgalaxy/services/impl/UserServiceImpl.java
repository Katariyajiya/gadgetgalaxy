package com.example.gadgetgalaxy.services.impl;

import com.example.gadgetgalaxy.dto.PageableResponse;
import com.example.gadgetgalaxy.dto.UserDto;
import com.example.gadgetgalaxy.entities.User;
import com.example.gadgetgalaxy.exception.ResourceNotFoundException;
import com.example.gadgetgalaxy.repositories.UserRepository;
import com.example.gadgetgalaxy.services.UserService;
import com.example.gadgetgalaxy.helper.*;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    private ModelMapper mapper;

    @Value("${user.profile.image.path}")
    private String imagePath;

    Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Override
    public UserDto createUser(UserDto userDto) {

        String userId = UUID.randomUUID().toString();

        userDto.setUserId(userId);

        User user = dtoToEntity(userDto);
        User savedUser =userRepository.save(user);

        UserDto newDto = entityToDto(savedUser);

        return newDto;
    }

    @Override
    public UserDto updateUser(UserDto userDto, String userId) {

        User user = userRepository.findById(userId).orElseThrow(()-> new ResourceNotFoundException("User with given id not found"));
        user.setName(userDto.getName());
        user.setAbout(userDto.getAbout());
        user.setImageName(userDto.getImageName());
        user.setPassword(userDto.getPassword());

        User updatedUser = userRepository.save(user);
        UserDto updatedDto = entityToDto(updatedUser);

        return updatedDto;
    }

    @Override
    public void deleteUser(String userId) throws IOException {
        User user = userRepository.findById(userId).orElseThrow(()-> new ResourceNotFoundException("User with give id not found!!"));
        String fullPath = imagePath + user.getImageName();
        Path path = Paths.get(fullPath);

        try {
            Files.delete(path);
            userRepository.delete(user);
        }catch (NoSuchFileException ex){
            logger.info("User image not found in folder");
            throw  new RuntimeException(ex);
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    @Override
    public PageableResponse<UserDto> getAllUser(int pageNumber, int pageSize, String sortBy, String sortDir) {

        Sort sort = (sortDir.equalsIgnoreCase("desc"))?(Sort.by(sortBy).descending()):(Sort.by(sortBy).ascending());

        //default page number starts from zero
        Pageable pageable = PageRequest.of(pageNumber,pageSize,sort);

        Page<User> page = userRepository.findAll(pageable);

        PageableResponse<UserDto> response = Helper.getPageableResponse(page, UserDto.class);

        return response;
    }

    @Override
    public UserDto getUserById(String userId) {
        User user = userRepository.findById(userId).orElseThrow(()->new ResourceNotFoundException("User with given id not found"));
        return entityToDto(user);
    }

    @Override
    public UserDto getUserByEmail(String email) {
        User user = userRepository.findByEmail(email).orElseThrow(()->new ResourceNotFoundException("User not found by given emailid"));
        return entityToDto(user);
    }

    @Override
    public List<UserDto> searchUser(String keyword) {
        List<User> userList = userRepository.findByNameContaining(keyword);
        List<UserDto> userDtos = userList.stream().map(user -> entityToDto(user)).collect(Collectors.toList());
        return userDtos;
    }

    private UserDto entityToDto(User savedUser){
//          UserDto userDto = UserDto.builder()
//                    .name(savedUser.getName())
//                    .password(savedUser.getPassword())
//                    .email(savedUser.getEmail())
//                    .gender(savedUser.getGender())
//                    .about(savedUser.getAbout())
//                    .imageName(savedUser.getImageName())
//                    .build();
//          return userDto;

        return mapper.map(savedUser,UserDto.class);
    }
    private User dtoToEntity(UserDto userDto){
//       User user = User.builder()
//                .name(userDto.getName())
//                .email(userDto.getEmail())
//                .password(userDto.getPassword())
//                .about(userDto.getAbout())
//                .gender(userDto.getGender())
//                .imageName(userDto.getImageName())
//                .build();
//
//       return user;
      return mapper.map(userDto,User.class);
    }

}
