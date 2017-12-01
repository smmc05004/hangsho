package kr.co.hangsho.company.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.company.service.CompanyService;
import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.company.vo.CompanyForm;
import kr.co.hangsho.company.vo.CompanyInfoForm;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.service.ProductQueService;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductAns;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.review.service.ReviewService;
import kr.co.hangsho.review.vo.Review;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductQueService productQueService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/index.do")
	public String main() {
		return "/company/index";
	}
	
	@RequestMapping("/register.do")
	public String form() {		
		return "/company/register";
	}
	
	@RequestMapping("/add.do")
	public String add(CompanyForm companyForm) {
		
		Company company = new Company();
		BeanUtils.copyProperties(companyForm, company);
		
		String encryptPassword = DigestUtils.sha256Hex(company.getPassword());
		company.setPassword(encryptPassword);

		companyService.addNewCompany(company);
		
		return "redirect:/index.do";
	}
	
	@RequestMapping("/detail.do")
	public String detail(HttpSession httpSession, Model model) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		
		model.addAttribute("company", company);
		
		return "/company/detail";
	}
	
	@RequestMapping("/modifyForm.do")
	public String modifyForm(HttpSession httpSession, Model model) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		
		model.addAttribute("company", company);
		
		return "/company/modify";
	}
	
	@RequestMapping("/modify.do")
	public String modify(CompanyForm companyForm, int companyId) {
		
		Company company = new Company();
		BeanUtils.copyProperties(companyForm, company);
		company.setId(companyId);
		String encryptPassword = DigestUtils.sha256Hex(company.getPassword());
		company.setPassword(encryptPassword);
		
		companyService.changeCompany(company);
		
		return "redirect:/index.do";
	}
	
	@RequestMapping("/reviewList.do")
	public String reviewList(HttpSession httpSession, Criteria criteria, Model model) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> reviewList = new HashMap<String, Object>();
		
		reviewList.put("companyId", companyId);
		reviewList.put("criteria", criteria);
		
		int totalRows = reviewService.getTotalRowsByMap(reviewList);
		criteria.setTotalRows(totalRows);
		
		model.addAttribute("criteria", criteria);
		
		List<Review> reviews =  reviewService.getReviewsByMap(reviewList);
		
		reviewList.remove("companyId");
		model.addAttribute("reviews", reviews);
		
		return "/company/reviewlist";
	}
	
	@RequestMapping("/getQuestionsForIndex.do")
	@ResponseBody
	public List<ProductQue> getQuestionsForIndex(HttpSession httpSession) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		List<ProductQue> ques = productQueService.getProductQuessForIndex(companyId);
		return ques;
	}
	
	@RequestMapping("/getProductsForIndex.do")
	@ResponseBody
	public List<Product> getProductsForIndex(HttpSession httpSession) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		List<Product> products = productService.getProductsForIndex(companyId);
		return products;
	}
	
	@RequestMapping("/getItemsForIndex.do")
	@ResponseBody
	public List<Item> getItemsForIndex(HttpSession httpSession) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		List<Item> items = itemService.getItemsForIndex(companyId);
		return items;
	}
	@RequestMapping("/getReviewsForIndex.do")
	@ResponseBody
	public List<Review> getReviewsForIndex(HttpSession httpSession) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		List<Review> reviews = reviewService.getReviewsForIndex(companyId);
		return reviews;
	}
	
}
