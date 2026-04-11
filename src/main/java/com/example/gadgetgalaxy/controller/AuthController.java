package com.example.gadgetgalaxy.controller;

import com.example.gadgetgalaxy.dto.UserDto;
import com.example.gadgetgalaxy.entities.User;
import com.example.gadgetgalaxy.exception.BadApiRequest;
import com.example.gadgetgalaxy.security.JwtHelper;
import com.example.gadgetgalaxy.security.JwtRequest;
import com.example.gadgetgalaxy.security.JwtResponse;
import com.example.gadgetgalaxy.services.UserService;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.Principal;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;

@RestController
@RequestMapping("/auth")
@CrossOrigin("*")
public class AuthController  {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private ModelMapper mapper;

    //Authentication manager will authenticate the user it is a functional interface
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserService userService;

    @Autowired
    JwtHelper helper;

    @Value("${googleClientId}")
    private String googleClientId;
    @Value("${newPassword}")
    private String newPassword;
    private Logger logger = LoggerFactory.getLogger(AuthController.class);



    @GetMapping("/current")
    public ResponseEntity<UserDto> getCurrentUser(Principal pricipal){
        String name = pricipal.getName();
        return new ResponseEntity<>(mapper.map(userDetailsService.loadUserByUsername(name),UserDto.class), HttpStatus.OK);
    }

    //creating login api in this we will send username and password and in response we will get token and userdto
    @PostMapping("/login")
    public ResponseEntity<JwtResponse> login(@RequestBody JwtRequest request){
        this.doAuthenticate(request.getUsername(),request.getPassword());
        UserDetails userDetails = userDetailsService.loadUserByUsername(request.getUsername());
        String token = this.helper.generateToken(userDetails);
        UserDto userDto = mapper.map(userDetails, UserDto.class);
        JwtResponse response = JwtResponse
                                    .builder()
                                    .jwtToken(token)
                                    .user(userDto)
                                    .build();

        return new ResponseEntity<>(response,HttpStatus.OK);
    }

    private void doAuthenticate(String username, String password) {
        UsernamePasswordAuthenticationToken authenticate = new UsernamePasswordAuthenticationToken(username,password);
        try {
            authenticationManager.authenticate(authenticate);
        }catch (BadCredentialsException e){
            throw new BadApiRequest("Invalid username password !!"+e);
        }
    }

    //login with google api
    @PostMapping("/google")
    public ResponseEntity<JwtResponse> loginWithGoogle(@RequestBody Map<String,Object> data) throws IOException {

        String idToken = data.get("idToken").toString();

        GoogleIdToken googleIdToken = GoogleIdToken.parse(
                JacksonFactory.getDefaultInstance(),
                idToken
        );

        GoogleIdToken.Payload payload = googleIdToken.getPayload();

        String email = payload.getEmail();

        User user = userService.findUserByEmailOptional(email).orElse(null);

        if (user == null) {
            user = saveUser(email, data.get("name"), data.get("photoUrl").toString());
        }

        return this.login(JwtRequest.builder()
                .username(email)
                .password(newPassword)
                .build());
    }
    private User saveUser(String email, Object name, String photoUrl) {
        UserDto newUser = UserDto.builder()
                .name(name.toString())
                .email(email)
                .password(newPassword)
                .imageName(photoUrl)
                .roles(new HashSet<>())
                .build();
        UserDto user = userService.createUser(newUser);
        return this.mapper.map(user,User.class);
    }

}
