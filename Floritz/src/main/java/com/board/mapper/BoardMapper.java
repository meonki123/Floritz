package com.board.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.board.login.CompanyVO;


@Repository("BoardMapper")
public interface BoardMapper {

	List<CompanyVO> getBoard();

	CompanyVO viewBoard(CompanyVO vo);

	CompanyVO orderBoard(CompanyVO vo);

	List<CompanyVO> searchByCompanyName(String keyword);

	List<CompanyVO> searchByCompanyAddress(String keyword);


}
