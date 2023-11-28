package com.board.user.service;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final GoogleUserService googleUserService;
    private final KakaoUserService kakaoUserService;
    private final NaverUserService naverUserService;

    public CustomOAuth2UserService(GoogleUserService googleUserService, KakaoUserService kakaoUserService, NaverUserService naverUserService) {
        this.googleUserService = googleUserService;
        this.kakaoUserService = kakaoUserService;
        this.naverUserService = naverUserService;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        switch (userRequest.getClientRegistration().getRegistrationId()) {
            case "google":
                googleUserService.saveOrUpdateUser(
                    oAuth2User.getAttribute("email"),
                    oAuth2User.getAttribute("picture"),
                    oAuth2User.getName()
                );
                break;
            case "kakao":
                kakaoUserService.saveOrUpdateUser(
                    oAuth2User.getAttribute("email"),
                    oAuth2User.getAttribute("profile_image"),
                    oAuth2User.getName()
                );
                break;
            case "naver":
                naverUserService.saveOrUpdateUser(
                    oAuth2User.getAttribute("email"),
                    oAuth2User.getAttribute("profile_image"),
                    oAuth2User.getName()
                );
                break;
            default:
                throw new IllegalArgumentException("Unsupported social login service");
        }

        return oAuth2User;
    }
}

