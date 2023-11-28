package com.board.login;

import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVO {
    private String id;
    private String companyPassword;
    private String companyName;  
    private String companyNumber;  
    private String companyAddress; 
    private String email;  
    private String phone;
    // 사업자 추가 정보
    private MultipartFile exteriorImage;  // MultipartFile 타입으로 변경
    private MultipartFile interiorImage;  // MultipartFile 타입으로 변경
    private String exteriorImagePath;  // 이미지 경로를 저장할 필드 추가
    private String interiorImagePath;  // 이미지 경로를 저장할 필드 추가
    private String description;
    private String closedDays;
    private String breakTime;
    @Transient
    private String userType; // userType 속성 추가
}
