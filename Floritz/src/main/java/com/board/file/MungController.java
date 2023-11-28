package com.board.file;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MungController {

	@Autowired
	FilesService filesService;

	@RequestMapping("/Mung/insert")
	public ModelAndView Insert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mung/insert");
		return mv;
	}

	@RequestMapping("/Mung/fileinsert")
	public String fileinsert(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		Files file = new Files();

		String sourceFileName = files.getOriginalFilename();
		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileUrl = "D:/dev/springboot/File/src/main/resources/static/companyimg/";
		// mung-1은 자기 프로젝트이름으로 체인지!!
	    // 이미지 파일의 확장자 목록
		/*
		 * List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");
		 * 
		 * // 업로드된 파일의 확장자가 이미지 파일의 확장자 목록에 포함되는지 확인 if
		 * (!allowedExtensions.contains(sourceFileNameExtension)) { // 잘못된 확장자 처리 // 예를
		 * 들어, 엑박 이미지를 표시하거나 다른 대체 이미지를 표시할 수 있습니다. return "redirect:/error-page"; }
		 */
		filesService.save(file);

		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} while (destinationFile.exists());

		destinationFile.getParentFile().mkdirs();
		files.transferTo(destinationFile);

		file.setFilename(destinationFileName);
		file.setFileOriName(sourceFileName);
		file.setFileurl(fileUrl);
		filesService.save(file);

		// 저장된 파일의 fno 값 확인
		/*
		 * int fno = file.getFno(); Files savedFile = filesService.findByFno(fno);
		 * System.out.println("fno: " + fno);
		 */
		return "redirect:/Mung/insert";
	}


	 @RequestMapping("mung/index5") 
	 public String index5(Model model) {
	 model.addAttribute("file", filesService.findByFno(0)); 
	 return "mung/index5";
	 }
	 

}
