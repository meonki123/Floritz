package com.board.domain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.login.CompanyVO;
import com.board.mapper.BoardMapper;

@Service
public class BoardService {
	
    @Autowired 
    private BoardMapper boardMapper;
	
    public List<CompanyVO> getBoard(){
        return boardMapper.getBoard();
    }

    
}