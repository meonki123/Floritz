package com.board.user.service;

import org.springframework.stereotype.Service;

import com.board.user.domain.NaverUser;
import com.board.user.repository.NaverUserRepository;

@Service
public class NaverUserService {
    private final NaverUserRepository naverUserRepository;

    public NaverUserService(NaverUserRepository naverUserRepository) {
        this.naverUserRepository = naverUserRepository;
    }

    public NaverUser saveOrUpdateUser(String email, String profile, String openid) {
        NaverUser user = naverUserRepository.findByEmail(email);
        if (user == null) {
            user = new NaverUser(email, profile, openid);
        } else {
            user.setEmail(email);
            user.setProfile(profile);
            user.setOpenid(openid);
        }
        return naverUserRepository.save(user);
    }
}

