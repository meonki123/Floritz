package com.board.user.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Entity
@Table(name = "KAKAO_USERS")
public class KakaoUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;
    private String profile;
    private String openid;

    public KakaoUser() {
    }

    public KakaoUser(String email, String profile, String openid) {
        this.email = email;
        this.profile = profile;
        this.openid = openid;
    }

    // getter, setter 등
}

