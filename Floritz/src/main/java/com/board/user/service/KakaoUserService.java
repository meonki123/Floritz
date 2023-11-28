package com.board.user.service;

import org.springframework.stereotype.Service;

import com.board.user.domain.KakaoUser;
import com.board.user.repository.KakaoUserRepository;

@Service
public class KakaoUserService {
    private final KakaoUserRepository kakaoUserRepository;

    public KakaoUserService(KakaoUserRepository kakaoUserRepository) {
        this.kakaoUserRepository = kakaoUserRepository;
    }

    public KakaoUser saveOrUpdateUser(String email, String profile, String openid) {
        KakaoUser user = kakaoUserRepository.findByEmail(email);
        if (user == null) {
            user = new KakaoUser(email, profile, openid);
        } else {
            user.setEmail(email);
            user.setProfile(profile);
            user.setOpenid(openid);
        }
        return kakaoUserRepository.save(user);
    }
}

