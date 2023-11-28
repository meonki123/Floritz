package com.board.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.board.user.service.CustomOAuth2UserService;

@Configuration
public class SecurityConfig {

    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeRequests()
                .antMatchers("**").permitAll()
                .and()
            .oauth2Login()
                .loginPage("/Login")
                .defaultSuccessUrl("/", true)
                .failureUrl("/Login")
                .userInfoEndpoint()
                    .userService(customOAuth2UserService);
        return http.build();
    }
}






