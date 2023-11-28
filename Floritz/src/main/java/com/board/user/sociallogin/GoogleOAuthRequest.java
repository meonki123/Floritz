package com.board.user.sociallogin;

import lombok.Data;

@Data
public class GoogleOAuthRequest {
    private String redirect_uri;
    private String client_id;
    private String client_secret;
    private String code;
    private String grant_type;
    // getter, setter 생략
}