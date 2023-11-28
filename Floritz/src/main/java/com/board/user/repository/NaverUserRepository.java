package com.board.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.board.user.domain.NaverUser;

public interface NaverUserRepository extends JpaRepository<NaverUser, Long> {
    NaverUser findByEmail(String email);
}
