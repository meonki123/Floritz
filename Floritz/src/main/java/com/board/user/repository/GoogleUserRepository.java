package com.board.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.board.user.domain.GoogleUser;

public interface GoogleUserRepository extends JpaRepository<GoogleUser, Long> {
    GoogleUser findByEmail(String email);
}
