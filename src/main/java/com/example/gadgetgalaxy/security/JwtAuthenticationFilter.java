package com.example.gadgetgalaxy.security;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.naming.MalformedLinkException;
import java.io.IOException;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {


    private Logger logger = LoggerFactory.getLogger(JwtAuthenticationFilter.class);

    @Autowired
    JwtHelper jwtHelper;

    @Autowired
    private UserDetailsService userDetailsService;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        //step1 check user cominh in header or not
        String requestHeader = request.getHeader("Authorization");
        logger.info("Header: {}",requestHeader);

        String username = null;
        String token = null;

        if (requestHeader != null && requestHeader.startsWith("Bearer")){

            token = requestHeader.substring(7);

            try {
                 username = this.jwtHelper.getUsernameFromToken(token);
            }catch (IllegalArgumentException e){
                logger.info("Illegal argument found while fetching the username!!");
                e.printStackTrace();

            }catch (MalformedJwtException e){
                logger.info("Token has been modied !!");
                e.printStackTrace();

            }catch (ExpiredJwtException e){
                logger.info("Jwt token has been expired");
                e.printStackTrace();
            }catch (Exception e){
                logger.info("Exception occured : {}",e);
                e.printStackTrace();
            }

        }else {
            logger.info("Invalid header value");
        }

        if (username != null && SecurityContextHolder.getContext().getAuthentication()==null){
            UserDetails userDetails = this.userDetailsService.loadUserByUsername(username);
            Boolean validated = this.jwtHelper.validateToken(token, userDetails);

            if (validated){

                UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails,null,userDetails.getAuthorities());
                authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authenticationToken);

            }else {
                logger.info("Token is not valid");
            }
        }
        filterChain.doFilter(request,response);
    }
}
