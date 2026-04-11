package com.example.gadgetgalaxy.services;


import com.example.gadgetgalaxy.dto.PageableResponse;
import com.example.gadgetgalaxy.dto.UserDto;
import com.example.gadgetgalaxy.entities.User;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface UserService {

    UserDto createUser(UserDto userDto);

    UserDto updateUser(UserDto userDto,String userId);

    void deleteUser(String userId) throws IOException;

    PageableResponse<UserDto> getAllUser(int pageNumber, int pageSize, String sortBy, String sortDir);

    UserDto getUserById(String userId);

    UserDto getUserByEmail(String email);

    List<UserDto> searchUser(String keyword);

    Optional<User> findUserByEmailOptional(String email);
}
