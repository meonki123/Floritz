package com.board.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.board.user.domain.KakaoUser;

public interface KakaoUserRepository extends JpaRepository<KakaoUser, Long> {
    KakaoUser findByEmail(String email);
}
