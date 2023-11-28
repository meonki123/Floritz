package com.board.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.login.CompanyVO;


@Mapper
public interface CompanyMapper {

	public void companyInsert(CompanyVO company);

	public CompanyVO companyLogin(Map<String, Object> company);

	// 사업자 정보 수정
	public CompanyVO findById(Map<String, Object> company);
	
	public void updateCompany(Map<String, Object> company);

	public void updateCompanyDetail(Map<String, Object> company);

	public void insertCompanyDetail(CompanyVO company);
}