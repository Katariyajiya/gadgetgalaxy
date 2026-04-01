package com.example.gadgetgalaxy.services.impl;

import com.example.gadgetgalaxy.dto.UserDto;
import com.example.gadgetgalaxy.entities.User;
import com.example.gadgetgalaxy.repositories.UserRepository;
import com.example.gadgetgalaxy.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.UUID;

public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDto createUser(UserDto userDto) {

        String userId = UUID.randomUUID().toString();

        userDto.setUserId(userId);

        User user = dtoToEntity(userDto);
        User savedUser =userRepository.save(user);

        UserDto newDto = entityToDto(savedUser);

        return null;
    }

    @Override
    public UserDto updateUser(UserDto userDto, String userId) {
        return null;
    }

    @Override
    public void deleteUser(String userId) {

    }

    @Override
    public List<UserDto> getAllUser() {
        return null;
    }

    @Override
    public UserDto getUserById(String userId) {
        return null;
    }

    @Override
    public UserDto getUserByEmail(String email) {
        return null;
    }

    @Override
    public List<UserDto> searchUser(String keyword) {
        return null;
    }

    private UserDto entityToDto(User savedUser){
          UserDto userDto = UserDto.builder()
                    .name(savedUser.getName())
                    .password(savedUser.getPassword())
                    .email(savedUser.getEmail())
                    .gender(savedUser.getGender())
                    .about(savedUser.getAbout())
                    .imageName(savedUser.getImageName())
                    .build();
          return userDto;
    }
    private User dtoToEntity(UserDto userDto){
       User user = User.builder()
                .name(userDto.getName())
                .email(userDto.getEmail())
                .password(userDto.getPassword())
                .about(userDto.getAbout())
                .gender(userDto.getGender())
                .imageName(userDto.getImageName())
                .build();

       return user;
    }

}
