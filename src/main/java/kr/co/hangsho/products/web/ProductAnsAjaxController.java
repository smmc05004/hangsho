package kr.co.hangsho.products.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.products.service.ProductAnsService;
import kr.co.hangsho.products.service.ProductQueService;
import kr.co.hangsho.products.vo.ProductAns;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
public class ProductAnsAjaxController {

	@Autowired
	private ProductAnsService productAnsService;
	
	@Autowired
	private ProductQueService productQueService; 
	
	// 상품문의 질문 하나에 나오는 판매자 답변 내용
	@RequestMapping("/hangshoproducts/getAnsContent.do")
	@ResponseBody
	public Map<String, Object> getProAnsContentByProQueId(Integer id) {
		ProductQue productQue = productQueService.getProductQueContent(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("productQue", productQue);
		//System.out.println(productQue.getStatus());
		if(productQue.getStatus().equals("Y")) {
			ProductAns ans = productAnsService.getProductAnsByProQueId(id);
			System.out.println(ans);
			map.put("productAns", ans);
		}
		return map;
	}
	
}	
