package kr.co.hangsho.privatedeal.web;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.categories.service.MiddleCategoryService;
import kr.co.hangsho.categories.service.SmallCategoryService;
import kr.co.hangsho.categories.vo.MiddleCategory;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.codes.vo.Code;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.privatedeal.service.PrivatedealService;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.privatedeal.web.form.PrivatedealForm;

@Controller
public class FormController {
	
	@Autowired
	PrivatedealService privatedealService;
	
	@Autowired
	MiddleCategoryService middleCategoryService;
	@Autowired
	SmallCategoryService smallCategoryService;
	
	@RequestMapping("/meronaform.do")
	public String meronaform(HttpSession httpSession) {
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		if(loginInfo == null) {
			return "redirect:/customers/login.do?error=deny"; 
		}
		
		return "/privatedeal/merona/form";
	}
	
	@RequestMapping("/usedform.do")
	public String usedform() {
		return "/privatedeal/used/form";
	}	
	
	@RequestMapping(value = "/insertMerona.do", method = RequestMethod.POST)
	public String insertMerona(PrivatedealForm privatedealForm, HttpSession httpSession) {
		
		Privatedeal privatedeal = new Privatedeal();
		BeanUtils.copyProperties(privatedealForm, privatedeal);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		if(loginInfo == null) {
			return "redirect:/customers/login.do?error=deny"; 
		}
		
		Customer customer = new Customer();
		if("CUSTOMER".equals(loginInfo.get("USER_TYPE"))) {
			customer = (Customer) loginInfo.get("LOGIN_USER");
		}
		privatedeal.setCustomer(customer);		
		
		SmallCategory smallCategory = new SmallCategory();
		smallCategory.setId(privatedealForm.getSmallcategory());
		privatedeal.setSmallcategory(smallCategory);	
		
		Code division = new Code();
		division.setId(privatedealForm.getDivision());
		privatedeal.setDivision(division);
		
		Code type = new Code();
		type.setId("M");
		privatedeal.setType(type);
		
		privatedealService.addPDBoard(privatedeal);		
		
		return "redirect:/merona/index.do";
	}
	
	@RequestMapping(value = "/insertUsed.do", method = RequestMethod.POST)
	public String insertUsed(PrivatedealForm privatedealForm, HttpSession httpSession) {
		
		Privatedeal privatedeal = new Privatedeal();
		BeanUtils.copyProperties(privatedealForm, privatedeal);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		if(loginInfo == null) {
			return "redirect:/customers/login.do?error=deny"; 
		}
		
		Customer customer = new Customer();
		if("CUSTOMER".equals(loginInfo.get("USER_TYPE"))) {
			customer = (Customer) loginInfo.get("LOGIN_USER");
		}
		privatedeal.setCustomer(customer);		
		
		SmallCategory smallCategory = new SmallCategory();
		smallCategory.setId(privatedealForm.getSmallcategory());
		privatedeal.setSmallcategory(smallCategory);	
		
		Code division = new Code();
		division.setId(privatedealForm.getDivision());
		privatedeal.setDivision(division);
		
		Code type = new Code();
		type.setId("U");
		privatedeal.setType(type);
		
		privatedealService.addPDBoard(privatedeal);
		
		return "redirect:/used/index.do";
	}
	
	@RequestMapping("/modify.do")
	public String modify(int no, Model model) {
		
		Privatedeal merona = privatedealService.getMeronaByNo(no);
		
		List<MiddleCategory> middleCategories = middleCategoryService.getMidCategoryByBigNo(merona.getSmallcategory().getMidCategory().getBigCategory().getId());
		List<SmallCategory> smallCategories = smallCategoryService.getSmaCategoryByMidNo(merona.getSmallcategory().getMidCategory().getId());
		
		model.addAttribute("merona", merona);
		model.addAttribute("middleCategories", middleCategories);
		model.addAttribute("smallCategories", smallCategories);
		
		return "/privatedeal/merona/modify";
	}
	
	@RequestMapping("/modifyU.do")
	public String modifyU(int no, Model model) {
		
		Privatedeal merona = privatedealService.getMeronaByNo(no);
		
		List<MiddleCategory> middleCategories = middleCategoryService.getMidCategoryByBigNo(merona.getSmallcategory().getMidCategory().getBigCategory().getId());
		List<SmallCategory> smallCategories = smallCategoryService.getSmaCategoryByMidNo(merona.getSmallcategory().getMidCategory().getId());
		
		model.addAttribute("merona", merona);
		model.addAttribute("middleCategories", middleCategories);
		model.addAttribute("smallCategories", smallCategories);
		
		return "/privatedeal/used/modify";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modify(PrivatedealForm privatedealForm, HttpSession httpSession) {
		
		Privatedeal privatedeal = new Privatedeal();
		BeanUtils.copyProperties(privatedealForm, privatedeal);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		if(loginInfo == null) {
			return "redirect:/customers/login.do?error=deny"; 
		}
		
		Customer customer = new Customer();
		if("CUSTOMER".equals(loginInfo.get("USER_TYPE"))) {
			customer = (Customer) loginInfo.get("LOGIN_USER");
		}
		privatedeal.setCustomer(customer);		
		
		SmallCategory smallCategory = new SmallCategory();
		smallCategory.setId(privatedealForm.getSmallcategory());
		privatedeal.setSmallcategory(smallCategory);	
		
		Code division = new Code();
		division.setId(privatedealForm.getDivision());
		privatedeal.setDivision(division);		
		
		privatedealService.modifyBoard(privatedeal);
		
		return "redirect:/merona/detail.do?no=" + privatedealForm.getId();
	}
	
	@RequestMapping(value = "/modifyU.do", method = RequestMethod.POST)
	public String modifyU(PrivatedealForm privatedealForm, HttpSession httpSession) {
		
		Privatedeal privatedeal = new Privatedeal();
		BeanUtils.copyProperties(privatedealForm, privatedeal);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		if(loginInfo == null) {
			return "redirect:/customers/login.do?error=deny"; 
		}
		
		Customer customer = new Customer();
		if("CUSTOMER".equals(loginInfo.get("USER_TYPE"))) {
			customer = (Customer) loginInfo.get("LOGIN_USER");
		}
		privatedeal.setCustomer(customer);		
		
		SmallCategory smallCategory = new SmallCategory();
		smallCategory.setId(privatedealForm.getSmallcategory());
		privatedeal.setSmallcategory(smallCategory);	
		
		Code division = new Code();
		division.setId(privatedealForm.getDivision());
		privatedeal.setDivision(division);		
		
		privatedealService.modifyBoard(privatedeal);
		
		return "redirect:/used/detail.do?no=" + privatedealForm.getId();
	}

	// 다중파일업로드
	@RequestMapping(value = "/file_uploader_html5.do", method = RequestMethod.POST)
	@ResponseBody
	public String multiplePhotoUpload(HttpServletRequest request) {
		// 파일정보
		StringBuffer sb = new StringBuffer();
		try {
			// 파일명을 받는다 - 일반 원본파일명
			String oldName = request.getHeader("file-name");
			// 파일 기본경로 _ 상세경로
			String filePath = "C:/spring-workspace/workspace/hangsho/src/main/webapp/resources/photoUpload/";
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
								.append(UUID.randomUUID().toString())
								.append(oldName.substring(oldName.lastIndexOf("."))).toString();
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + saveName);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true")
			  .append("&sFileName=").append(oldName)
			  .append("&sFileURL=").append("http://www.hangsho.com/resources/photoUpload/").append(saveName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
