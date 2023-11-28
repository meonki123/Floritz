package com.board.user.service;

import org.springframework.stereotype.Service;

import com.board.user.domain.GoogleUser;
import com.board.user.repository.GoogleUserRepository;

@Service
public class GoogleUserService {
    private final GoogleUserRepository googleUserRepository;

    public GoogleUserService(GoogleUserRepository googleUserRepository) {
        this.googleUserRepository = googleUserRepository;
    }

    public GoogleUser saveOrUpdateUser(String email, String profile, String openid) {
        GoogleUser user = googleUserRepository.findByEmail(email);
        if (user == null) {
            user = new GoogleUser(email, profile, openid);
        } else {
            user.setEmail(email);
            user.setProfile(profile);
            user.setOpenid(openid);
        }
        return googleUserRepository.save(user);
    }
}
