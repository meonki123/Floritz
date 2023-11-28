package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import com.board.login.CompanyVO;
import com.board.mapper.BoardMapper;

@Controller
public class IndexController {
	
    
    @Autowired
	private  BoardMapper   boardMapper;
    
    
	// 단체 예약 리스트
	@RequestMapping("/List")
	public  ModelAndView  list() {
		List<CompanyVO>  boardList = boardMapper.getBoard();		
		ModelAndView mv = new ModelAndView();
		mv.addObject("brdList", boardList);
		mv.setViewName("board/list");
		return mv;
	}
	
	// 상세보기
	@RequestMapping("/View")
	public  ModelAndView   view(@RequestParam("id") String id, CompanyVO vo) {
		vo.setId(id);
		CompanyVO companyVO =  boardMapper.viewBoard( vo ); 
		System.out.println("Viewvo:" + companyVO);
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", companyVO);
		mv.setViewName("/board/view");
		
		return mv;
	}

	// 주문
	@RequestMapping("/Order")
	public  ModelAndView   order() {
		ModelAndView  mv  = new ModelAndView();
		mv.setViewName("order/order");		
		return mv;
	}
	// 주문
	/*
	@RequestMapping("/Order")
	public  ModelAndView   order(@RequestParam("id") String id, CompanyVO vo) {
		vo.setId(id);
		CompanyVO companyVO =  boardMapper.orderBoard( vo ); 
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", companyVO);
		mv.setViewName("order/order");		
		return mv;
	}
	*/

    @RequestMapping("/Search")
    public String search(@RequestParam("searchType") String searchType, @RequestParam("keyword") String keyword, Model model) {
        List<CompanyVO> searchResult;
        
        if(searchType.equals("companyName")) {
            searchResult = boardMapper.searchByCompanyName(keyword);
        } else if(searchType.equals("companyAddress")) {
            searchResult = boardMapper.searchByCompanyAddress(keyword);
        } else {
            searchResult = null;
        }
        
        model.addAttribute("searchResult", searchResult);
        return "redirect:/List";
    }
}