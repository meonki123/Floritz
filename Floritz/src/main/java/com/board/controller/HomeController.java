package com.board.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.login.CompanyVO;
import com.board.login.UserVo;
import com.board.mapper.CompanyMapper;
import com.board.mapper.UserMapper;

@Controller
public class HomeController {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private CompanyMapper companyMapper;

	// http://localhost
	@RequestMapping("/")
	public ModelAndView home(String name) {
		// String name = "안유진";
		ModelAndView mv = new ModelAndView();
		mv.addObject("irum", name);
		mv.setViewName("home");
		return mv; // /WEB-INF/views/ home .jsp
	}

	// chatBot Go
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatbot/chat");
		return mv;
	}

	// 개인 로그인
	@RequestMapping("/Login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/login");
		return mv;
	}

	// 개인 로그인 처리
	@PostMapping("/userLogin")
	public String userLogin(@RequestParam("id") String id, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes redirectAttributes) {
		Map<String, Object> user = new HashMap<>();
		user.put("id", id);
		user.put("password", password);
		UserVo userVo = userMapper.userLogin(user);

		if (userVo != null) {
			userVo.setUserType("personal"); // userType 설정
			session.setAttribute("user", userVo);
			session.setAttribute("userType", "personal"); // userType을 세션에 저장
			return "redirect:/";
		} else {
			redirectAttributes.addFlashAttribute("message", "아이디 또는 비밀번호가 잘못되었습니다.");
			return "redirect:/Login"; // 대문자 'L'로 시작하는 "/Login"으로 변경합니다.
		}
	}

	// 사업자 로그인 처리
	@PostMapping("/companyLogin")
	public String companyLogin(@RequestParam("id") String id, @RequestParam("companyPassword") String companyPassword,
			HttpSession session, RedirectAttributes redirectAttributes) {
		Map<String, Object> company = new HashMap<>();
		company.put("id", id);
		company.put("companyPassword", companyPassword);
		CompanyVO companyVO = companyMapper.companyLogin(company);

		if (companyVO != null) {
			companyVO.setUserType("company"); // userType 설정
			System.out.println(companyVO);
			session.setAttribute("company", companyVO);
			session.setAttribute("userType", "company"); // userType을 세션에 저장
			return "redirect:/";
		} else {
			redirectAttributes.addFlashAttribute("message", "아이디 또는 비밀번호가 잘못되었습니다.");
			return "redirect:/Login"; // 대문자 'L'로 시작하는 "/Login"으로 변경합니다.
		}
	}

	// 마이페이지
	@GetMapping("/MyPage")
	public String myPage(Model model, HttpSession session) {
		String userType = (String) session.getAttribute("userType");
		if ("personal".equals(userType)) {
			UserVo userVo = (UserVo) session.getAttribute("user");
			if (userVo != null) {
				UserVo user = userMapper.findById(userVo.getId());
				model.addAttribute("user", user);
			}
			return "user/mypage";
		} else if ("company".equals(userType)) {
			CompanyVO companyVO = (CompanyVO) session.getAttribute("company"); // 'company' 키로 사업자 사용자 정보 가져오기
			if (companyVO != null) {
				Map<String, Object> params = new HashMap<>();
				params.put("id", companyVO.getId()); // 변경한 부분
				CompanyVO company = companyMapper.findById(params);
				model.addAttribute("company", company);
			}
			return "company/mypage";
		}
		// 타입이 없거나 잘못된 경우에 대한 처리
		return "error";
	}

	// 개인 프로필 수정 페이지
	@GetMapping("/editprofile")
	public String editProfile(Model model, HttpSession session) {
		UserVo userVo = (UserVo) session.getAttribute("user");
		if (userVo != null) {
			UserVo user = userMapper.findById(userVo.getId());
			model.addAttribute("user", user);
		}
		return "user/editprofile";
	}

	// 개인 프로필 수정 처리
	@PostMapping("/updateprofile")
	public String updateProfile(UserVo userVo, HttpSession session, RedirectAttributes redirectAttributes) {
		String userType = (String) session.getAttribute("userType");
		if (!"personal".equals(userType)) {
			return "error"; // 개인 사용자가 아닐 경우 에러 페이지로 리다이렉트
		}
		if (userVo != null && userVo.getId() != null) {
			UserVo currentUser = (UserVo) session.getAttribute("user");
			if (currentUser != null && userVo.getId().equals(currentUser.getId())) {
				userMapper.update(userVo);
				session.setAttribute("user", userVo);
				redirectAttributes.addFlashAttribute("message", "수정되었습니다!");
			}
		}
		return "redirect:/MyPage";
	}

	// 로그아웃
	@GetMapping("/Logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		session.invalidate();
		response.sendRedirect(request.getContextPath() + "/");
		return null;
	}

	// 회원가입 페이지
	@RequestMapping("/Join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/join");
		return mv;
	}

	// 회원가입 처리
	@PostMapping("/userInsert")
	public String userInsert(@ModelAttribute UserVo user) {
		if (user.getId() == null || user.getId().isEmpty()) {
			// id가 null이거나 빈 문자열이라면 오류 메시지를 표시하고 회원가입 페이지로 리다이렉트
			return "redirect:/Join";
		}

		userMapper.userInsert(user);
		return "redirect:/Login";
	}

	// 사업자 회원가입 처리
	@PostMapping("/companyInsert") // 경로를 "/companyInsert"으로 변경합니다.
	public String companyInsert(@ModelAttribute CompanyVO company) {
	    if (company.getId() == null || company.getId().isEmpty()) {
	        // id가 null이거나 빈 문자열이라면 오류 메시지를 표시하고 회원가입 페이지로 리다이렉트
	        return "redirect:/Join";
	    }

	    // COMPANY 테이블에 사업자 정보 저장
	    companyMapper.companyInsert(company);

	    // COMPANYDETAIL 테이블에 레코드 생성. COMPANYID는 가입한 사업자의 ID로 설정하고, 나머지 필드는 NULL로 초기화
	    // CompanyVO에 모든 정보가 있으므로 CompanyDetailVO는 필요 없습니다.
	    companyMapper.insertCompanyDetail(company);

	    return "redirect:/Login";
	}



	// 사업자 프로필 수정 페이지
	@GetMapping("/EditCompany")
	public String editCompany(Model model, HttpSession session) {
		CompanyVO companyVO = (CompanyVO) session.getAttribute("company"); // 'company' 키로 사업자 사용자 정보 가져오기
		if (companyVO != null && companyVO.getId() != null) {
			Map<String, Object> params = new HashMap<>();
			params.put("id", companyVO.getId());
			CompanyVO company = companyMapper.findById(params);
			model.addAttribute("company", company); // 'company'를 'user'로 변경
		}
		return "company/editprofile";
	}

	// 사업자 프로필 수정 처리
	@PostMapping("/UpdateCompany")
	public String updateCompany(CompanyVO companyVO, HttpSession session, RedirectAttributes redirectAttributes) {
	    if (companyVO == null) {
	        throw new RuntimeException("사업자 정보가 제공되지 않았습니다.");
	    }
	    String userType = (String) session.getAttribute("userType");
	    if (!"company".equals(userType)) {
	        throw new RuntimeException("사업자만 접근 가능합니다.");
	    }

	 // 비밀번호가 입력되지 않았다면 현재 비밀번호를 유지
	    CompanyVO currentCompany = (CompanyVO) session.getAttribute("company");
	    if (currentCompany == null) {
	        throw new RuntimeException("세션에 사업자 정보가 존재하지 않습니다.");
	    }
	    if (companyVO.getCompanyPassword() == null || companyVO.getCompanyPassword().isEmpty()) {
	        companyVO.setCompanyPassword(currentCompany.getCompanyPassword());
	    }

	    if (companyVO.getId() != null && companyVO.getId().equals(currentCompany.getId())) {
	        // 이미지 처리 로직
	        MultipartFile exteriorImageFile = companyVO.getExteriorImage();
	        MultipartFile interiorImageFile = companyVO.getInteriorImage();

	        String exteriorImagePath = saveImage(exteriorImageFile);
	        String interiorImagePath = saveImage(interiorImageFile);

	        companyVO.setExteriorImagePath(exteriorImagePath);
	        companyVO.setInteriorImagePath(interiorImagePath);

	        // 수정된 부분 시작
	        // CompanyVO를 Map으로 변환
	        Map<String, Object> companyMap = new HashMap<>();
	        companyMap.put("company", companyVO);

	        // 비밀번호가 null이 아니라면 비밀번호 업데이트
	        if ((companyVO.getCompanyPassword() != null && !companyVO.getCompanyPassword().isEmpty()) ||
	            (companyVO.getCompanyName() != null && !companyVO.getCompanyName().isEmpty()) ||
	            (companyVO.getCompanyNumber() != null && !companyVO.getCompanyNumber().isEmpty()) ||
	            (companyVO.getCompanyAddress() != null && !companyVO.getCompanyAddress().isEmpty()) ||
	            (companyVO.getEmail() != null && !companyVO.getEmail().isEmpty()) ||
	            (companyVO.getPhone() != null && !companyVO.getPhone().isEmpty())) {
	            companyMapper.updateCompany(companyMap);
	        }

	        companyMapper.updateCompanyDetail(companyMap);
	        // 수정된 부분 끝

	        // DB에서 최신 회사 정보를 가져와 세션에 저장
	        Map<String, Object> company = new HashMap<>();
	        company.put("id", companyVO.getId());
	        company.put("companyPassword", companyVO.getCompanyPassword());
	        CompanyVO updatedCompanyVO = companyMapper.companyLogin(company);
	        session.setAttribute("company", updatedCompanyVO);

	        session.setAttribute("company", companyVO);
	        redirectAttributes.addFlashAttribute("message", "수정되었습니다!");
	    }
	    return "redirect:/MyPage";
	}

	// 이미지를 저장하고, 저장된 이미지의 상대 경로를 반환하는 메서드
	private String saveImage(MultipartFile imageFile) {
	    // 저장할 디렉토리의 절대 경로
	    String uploadDir = "src/main/resources/static/companyimg";

	    // 파일의 원래 이름에서 확장자를 추출
	    String extension = StringUtils.getFilenameExtension(imageFile.getOriginalFilename());

	    // 랜덤한 값을 생성
	    String randomValue = new BigInteger(130, new SecureRandom()).toString(32);

	    // 저장할 파일의 이름을 생성 (현재 시간의 밀리초 + 랜덤 값 + 확장자)
	    String filename = System.currentTimeMillis() + randomValue + "." + extension;

	    // 저장할 파일의 절대 경로를 생성
	    Path imagePath = Paths.get(uploadDir, filename);

	    try {
	        // 이미지 파일을 저장
	        Files.copy(imageFile.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);
	    } catch (IOException e) {
	        throw new RuntimeException("이미지 파일을 저장하는데 실패했습니다.", e);
	    }
	    // 저장된 이미지의 상대 경로를 반환
	    return "/static/companyimg/" + filename;
	}
}
