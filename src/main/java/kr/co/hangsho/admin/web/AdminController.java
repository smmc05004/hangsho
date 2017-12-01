package kr.co.hangsho.admin.web;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hangsho.admin.service.AdminService;
import kr.co.hangsho.admin.vo.LoginHistory;
import kr.co.hangsho.company.service.CompanyService;
import kr.co.hangsho.customers.services.CustomerService;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.qnas.services.QnaService;
import kr.co.hangsho.qnas.vo.Qna;
import kr.co.hangsho.sliders.vo.Slider;
import kr.co.hangsho.sliders.vo.SliderInformation;
import kr.co.hangsho.web.code.CodeGenerator;
import kr.co.hangsho.web.code.service.CodeService;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	@Autowired
	CodeService codeService;
	@Autowired
	CompanyService companyService;
	@Autowired
	CustomerService customerService;
	@Autowired
	ProductService productService;
	@Autowired
	ItemService itemService;
	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/index.do")
	public String index(Model model, Criteria c) {
		model.addAttribute("products", adminService.getProducts(c));
		model.addAttribute("companies", companyService.getAllCompanies());
		model.addAttribute("qnas", qnaService.getQnaList());
		model.addAttribute("customers", customerService.getAllCustomers());
		return "admin/index";
	}
	
	// 상품관리
	
	@RequestMapping("/prolist.do")
	public String productList(Criteria criteria, Model model) {
		model.addAttribute("products", adminService.getProducts(criteria));
		return "admin/prolist";
	}
	
	@RequestMapping("/prodetail.do")
	public String prodetail(@RequestParam("id") int proId, Model model) {
		
		List<Item> items = itemService.getItemsByProductId(proId);
		long minPrice = Long.MAX_VALUE;
		for (Item item : items) {
			if(minPrice > item.getSalePrice()) {
				minPrice = item.getSalePrice();
			}
		}
		model.addAttribute("product", adminService.getProductByProductId(proId));
		model.addAttribute("items", items);
		model.addAttribute("minPrice", minPrice);
		
		return "admin/prodetail";
	}
	
	@RequestMapping("/recompro.do")
	public String recompro(Model model) {
		model.addAttribute("sliders", adminService.getSliders());
		System.out.println(adminService.getSliders());
		return "admin/recompro";
	}
	
	@RequestMapping("/recomadd.do")
	public String recomadd(int[] productId,  Slider slider, int sid) {
		int sliderId = adminService.getSliderSeq();
		slider.setId(sliderId);
		adminService.addSlider(slider);
		for(int proId : productId) {
			SliderInformation sliderInfo = new SliderInformation();
			Slider slider2 = new Slider();
			slider2.setId(sliderId);
			Product product = new Product();
			product.setId(proId);
			
			sliderInfo.setSlider(slider2);
			sliderInfo.setProduct(product);
			
			adminService.addSliderInfo(sliderInfo);
		}
		adminService.deleteSlider(sid);
		
		return "redirect:recompro.do";
	}
	
	@RequestMapping("/recomdetail.do")
	public String recomdetail(@RequestParam("id") int sliderId, Criteria criteria, Model model) {
		model.addAttribute("sliderInfos", adminService.getSliderInfoListById(sliderId));
		model.addAttribute("products", adminService.getProductList(criteria));
		model.addAttribute("slider", adminService.getSliderById(sliderId));
		System.out.println(adminService.getSliderById(sliderId));
		return "admin/recomdetail";
	}
	
	@RequestMapping("/recomform.do")
	public String recomform(Criteria criteria, Model model) {
		model.addAttribute("products", adminService.getProductList(criteria));
		return "admin/recomadd";
	}
	
	// 실적관리
	
	@RequestMapping("/earning.do")
	public String earning() {
		return "admin/earning";
	}
	
	@RequestMapping("/earningall.do")
	public String earningall(Criteria criteria, Model model) {
		model.addAttribute("companies", companyService.getAllCompanies());
		return "admin/earningall";
	}
	
	@RequestMapping("/earningpro.do")
	public String earningpro(Criteria criteria, Model model) {
			model.addAttribute("items", adminService.getItems(criteria));
		return "admin/earningpro";
	}
	
	@RequestMapping("/earningcom.do")
	public String earningcom(Criteria criteria, Model model) {
		model.addAttribute("companies", companyService.getAllCompanies());
		return "admin/earningcom";
	}
	
	
	// 회원관리
	
	@RequestMapping("/membercom.do")
	public String memberCompany(Model model) {
		model.addAttribute("companies", companyService.getAllCompanies());
		return "admin/membercom";
	}
	
	@RequestMapping("/membercus.do")
	public String memberCustomer(Model model) {
		model.addAttribute("customers", customerService.getAllCustomers());
		return "admin/membercus";
	}
	
	@RequestMapping("/comdetail.do")
	public String comDetail(Model model, @RequestParam("com") int comId) {
		model.addAttribute("com", companyService.getCompanyByCompanyId(comId));
		Map<String, Object> company = new HashMap<String, Object>();
		Criteria c = new Criteria();
		company.put("companyId", comId);
		company.put("criteria", c);
		model.addAttribute("products", productService.getProductsByComId(company));
		return "admin/comdetail";
	}
	
	@RequestMapping("/cusdetail.do")
	public String cusDetail(Model model, @RequestParam("cus") int cusId) {
		
		return "admin/cusdetail";
	}
	
	// 문의관리
	
	@RequestMapping("/qnalist.do")
	public String qnalist(Model model) {
		model.addAttribute("qnas", qnaService.getQnaList());
		return "admin/qnalist";
	}
	
	@RequestMapping("/login.do")
	public String loginForm() {
		if (codeService.getCode() == null) {
			codeService.addCode(CodeGenerator.generateCode());
			System.out.println("오늘의 코드 추가");
		}
		return "admin/login";
	}
	
	@RequestMapping("/addreply.do")
	public String addReply(int qnaId, int replyId, String contents) {
		
		Qna qna = new Qna();
		Qna replyQna = new Qna();
		
		int reqnaId = qnaService.getSeq();
		replyQna.setId(reqnaId);
		replyQna.setReplyId(reqnaId);
		replyQna.setContents(contents);
		
		qna.setReplyId(reqnaId);
		qna.setId(qnaId);
		
		// 답변이 있었을 때 (수정)
		if(replyId != 0) {
			
		}
		
		qnaService.addQnaReply(replyQna);
		qnaService.updateQna(qna);
		
		return "redirect:qnalist.do";
	}
	
	public String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
        //proxy 환경일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
            System.out.println("Proxy-Client-ip : " + ip);
        }
        //웹로직 서버일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");
            System.out.println("WL-Proxy-Client-IP : " + ip);
        }
        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr() ;
            System.out.println("Remote Address : " + ip);
        }
		if (ip == null || ip.length() == 0) {
		ip = request.getHeader("HTTP_CLIENT_IP");
		System.out.println("HTTP_CLIENT_IP : " + ip);
		}
		if (ip == null) {
		ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		System.out.println("HTTP_X_FORWARDED_FOR : " + ip);
		}
		return ip;
	}
	
	@RequestMapping("/logincheck.do")
	public String login(String code, HttpServletRequest request, HttpSession session) {
		Map<String, Object> loginInfo = new HashMap<String, Object>();
		loginInfo.put("USER_TYPE", "ADMIN");
		loginInfo.put("LOGIN_USER", "ADMIN");
		System.out.println(codeService.getCode());
		if(code.equals(codeService.getCode())) {
			session.setAttribute("LOGIN_INFO", loginInfo);
			LoginHistory loginHistory = new LoginHistory();
			Date time = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
			loginHistory.setIp(getIp(request));
			loginHistory.setTime(time);
			adminService.addLoginHistory(loginHistory);
			return "redirect:index.do";
		} else {
			return "redirect:login.do?access=deny";
		}
	}
	
}
