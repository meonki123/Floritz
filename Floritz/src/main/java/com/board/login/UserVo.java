package com.board.login;

import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
@NonNull
public class UserVo {
    private String id;
    private String password;
    private String name;
    private String email;
    private String phone;
    @Transient
    private String userType;  // userType 속성 추가
    // getters and setters
}

