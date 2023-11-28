package com.board.user.sociallogin;

import lombok.Data;

@Data
public class GoogleOAuthResponse {
    private String access_token;
    private String expires_in;
    private String refresh_token;
    private String scope;
    private String token_type;
    private String id_token;
    // getter, setter 생략
}