package kr.co.hangsho.products.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.hangsho.categories.service.MiddleCategoryService;
import kr.co.hangsho.categories.service.SmallCategoryService;
import kr.co.hangsho.categories.vo.MiddleCategory;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.company.service.CompanyService;
import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.products.service.ProductAnsService;
import kr.co.hangsho.products.service.ProductQueService;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductAns;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/product")
public class ProductAjaxController {

	@Autowired
	private MiddleCategoryService middleCategoryService;
	
	@Autowired
	private SmallCategoryService smallCategoryService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductQueService productQueService;
	
	@Autowired
	private ProductAnsService productAnsService;
	
	@RequestMapping("/getMidCate.do")
	@ResponseBody
	public List<MiddleCategory> getMidCategoryByBigCaNo(int bigCateNum) {
		List<MiddleCategory> middleCategories = middleCategoryService.getMidCategoryByBigNo(bigCateNum);
		return middleCategories;
	}
	
	@RequestMapping("/getSmaCate.do")
	@ResponseBody
	public List<SmallCategory> getsmaCategoryByMidCaNo(int midCateNum) {
		List<SmallCategory> smallCategories = smallCategoryService.getSmaCategoryByMidNo(midCateNum);
		return smallCategories;
	}
	
	@RequestMapping("/getProducts.do")
	@ResponseBody
	public Map getProductListByCompanyId(HttpSession httpSession, Criteria criteria) {
	      
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		  
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("companyId", companyId);
		  
		int totalRows= productService.getTotalRowsByCriteria(searchMap);
		criteria.setTotalRows(totalRows);
		  
		List<Product> products = productService.getProductsByComId(searchMap);
		searchMap.remove("companyId");
		searchMap.put("products", products);
		
		return searchMap;
	 }

	@RequestMapping("/delete.do")
	@ResponseBody
	public Map<String, Object> deleteProductByProductId(int productId, HttpSession httpSession, Criteria criteria) {
		Product product = productService.deleteProductByProductId(productId);
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("companyId", companyId);
		
		int totalRows= productService.getTotalRowsByCriteria(searchMap);
		criteria.setTotalRows(totalRows);
		
		List<Product> products = productService.getProductsByComId(searchMap);
		searchMap.remove("companyId");
		searchMap.put("products", products);
		
		return searchMap;
	}
	
	@RequestMapping("/change.do")
	@ResponseBody
	public Map<String, Object> modifyProductById(int productId, HttpSession httpSession, Criteria criteria) {
		
		Product product = productService.getProductByProductId(productId);
		productService.modifyProduct(product);
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("companyId", companyId);
		
		int totalRows= productService.getTotalRowsByCriteria(searchMap);
		criteria.setTotalRows(totalRows);
		
		List<Product> products = productService.getProductsByComId(searchMap);
		searchMap.remove("companyId");
		searchMap.put("products", products);
		
		return searchMap;
	}
	
	@RequestMapping("/getAnswer.do")
	@ResponseBody
	public Map<String, Object> getQnA(int questionId) {
		
		Map<String, Object> qna = new HashMap<String, Object>();
		
		ProductAns productAns = productAnsService.getProductAnswerByQuestionId(questionId);
		if (productAns != null) {
			qna.put("productAns", productAns);
			
		} else if (productAns == null) {
			ProductQue productQue = productQueService.getProductQueById(questionId);
			qna.put("productQue", productQue);
		}
		return qna;
	}
	
	@RequestMapping("/addAnswer.do")
	@ResponseBody
	public ProductAns addAnswer(int productId, int questionId, String answer) {
		System.out.println("productId:" + productId + "questionId:" + questionId + "answer" + answer);
		
		ProductAns productAns = new ProductAns();
		productAns.setId(questionId);
		productAns.setAnswer(answer);
		ProductQue productQue = productQueService.getProductQueById(questionId);
		
		Product product = productService.getProductByProductId(productId);
		
		int companyId = product.getCompany().getId();
		Company company = companyService.getCompanyByCompanyId(companyId);
		productAns.setCompany(company);
		productAns.setQna(productQue);
		
		productQue.setStatus("Y");
		System.out.println("productQue:" + productQue);
		productQueService.updateProductQue(productQue);
		
		productAnsService.addProductAns(productAns);
		System.out.println("productAns");
		return productAns;
	}
}
