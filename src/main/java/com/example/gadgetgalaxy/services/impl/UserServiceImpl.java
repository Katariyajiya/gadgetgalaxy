package com.example.gadgetgalaxy.services.impl;

import com.example.gadgetgalaxy.dto.UserDto;
import com.example.gadgetgalaxy.entities.User;
import com.example.gadgetgalaxy.exception.ResourceNotFoundException;
import com.example.gadgetgalaxy.repositories.UserRepository;
import com.example.gadgetgalaxy.services.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    private ModelMapper mapper;

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
    public void deleteUser(String userId) {
        User user = userRepository.findById(userId).orElseThrow(()-> new ResourceNotFoundException("User with give id not found!!"));
        userRepository.delete(user);
    }

    @Override
    public List<UserDto> getAllUser() {
        List<User> users = userRepository.findAll();
        List<UserDto> userDtos = users.stream().map(user -> entityToDto(user)).collect(Collectors.toList());
        return userDtos;
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
