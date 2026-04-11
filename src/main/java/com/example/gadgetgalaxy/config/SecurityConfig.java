package com.example.gadgetgalaxy.config;

import com.example.gadgetgalaxy.security.JwtAuthenticationEntryPoint;
import com.example.gadgetgalaxy.security.JwtAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.util.Arrays;


// another method to implement the jwt security is
// by enabling method level security that is [@EnableGlobalMethodSecurity(prePostEnabled = true)],
// then after doing this we need to manually add [@PreAuthorize("hasRole('ADMIN')")] to every controller method
// where we want to give the admin rights only or any other roles rights we can pass diffrent roles in hasRole field
@Configuration
public class SecurityConfig {

    @Autowired
    private  UserDetailsService userDetailsService;

    //below two are required for jwt config

    @Autowired
    JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
    @Autowired
    JwtAuthenticationFilter jwtAuthenticationFilter;

    @Bean
     DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(userDetailsService);
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        return daoAuthenticationProvider;

    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{

        http
                .csrf(csrf->csrf.disable())
                .authenticationProvider(authenticationProvider())
                .authorizeHttpRequests(
                        auth -> auth
                                .requestMatchers("/auth/login")
                                .permitAll()
                                .requestMatchers("/auth/google")
                                .permitAll()
                                .requestMatchers("/users/create")
                                .permitAll()
                                .requestMatchers("/users/**").hasAuthority("ROLE_ADMIN")
                                .anyRequest()
                                .authenticated()
                )
                .exceptionHandling(
                        exception -> exception
                                         .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                )
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        http.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public AuthenticationManager  authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


// C O R S     C O N F I G U R A T I O N
@Bean
 public FilterRegistrationBean corsFilter(){

     UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();

     CorsConfiguration corsConfiguration = new CorsConfiguration();
     corsConfiguration.setAllowCredentials(true);
     //corsConfiguration.setAllowedOrigins(Arrays.asList("http://localhost:4200")); or for all orign allowing can do the below
     corsConfiguration.addAllowedOriginPattern("*");
     corsConfiguration.addAllowedHeader("Authorization");
     corsConfiguration.addAllowedHeader("Content-Type");
     corsConfiguration.addAllowedHeader("Accept");
     corsConfiguration.addAllowedMethod("GET");
     corsConfiguration.addAllowedMethod("POST");
     corsConfiguration.addAllowedMethod("PUT");
     corsConfiguration.addAllowedMethod("DELETE");
     corsConfiguration.addAllowedMethod("OPTIONS");
     corsConfiguration.setMaxAge(3600L);

     source.registerCorsConfiguration("/**", corsConfiguration);

     FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new CorsFilter(source));
     filterRegistrationBean.setOrder(-110);
                         /*🔹 What setOrder(-1) means

                    👉 It sets the priority/order of the filter in the filter chain.

                    Lower number = higher priority (runs earlier)
                    Higher number = runs later

                    So:

                    -1 → runs before most other filters
                    🔹 Why this is important

                    CORS must be handled before security filters (like Spring Security), otherwise:

                    Preflight (OPTIONS) requests might get blocked
                    You’ll see CORS errors even if config is correct
                    🔹 In short

                    👉 setOrder(-1) = run CORS filter very early in the request lifecycle
                    👉 Ensures preflight requests are processed before authentication/security*/
     return filterRegistrationBean;
 }


























    //authentication via http basic
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
//
//        http
//                .csrf(csrf->csrf.disable())
//                .cors(cors->cors.disable())
//                .authenticationProvider(authenticationProvider())
//                .authorizeHttpRequests(
//                auth -> auth
//                        .anyRequest()
//                        .authenticated()
//        ).httpBasic(Customizer.withDefaults());
//
//        return http.build();
//    }


    //form based authentication not so recomended
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//
//        http.authorizeHttpRequests(
//                auth->auth
//                        .anyRequest()
//                        .authenticated()
//                )
//                .formLogin(
//                form -> form
//                        .loginPage("login.html")
//                        .loginProcessingUrl("/process-url")
//                        .defaultSuccessUrl("/dashboard")
//                        .failureUrl("/error")
//                ).logout(
//                        logout->logout
//                                .logoutUrl("/logout")
//                                .logoutSuccessUrl("/login.html?logout")
//        );
//        return http.build();
//    }
}