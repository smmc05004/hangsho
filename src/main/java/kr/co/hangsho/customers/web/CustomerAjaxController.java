package kr.co.hangsho.customers.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.customers.services.CustomerService;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.products.service.ProductAnsService;
import kr.co.hangsho.products.vo.ProductAns;

@Controller
@RequestMapping("/customers")
public class CustomerAjaxController {

	@Autowired
	CustomerService customerService;
	@Autowired
	ProductAnsService ansService;
	
	@RequestMapping("/pwdcheck.do")
	public @ResponseBody String pwdCheck(String pwd, HttpSession session) {
		String checked = "false";
		  Customer customer =  (Customer) ((Map)session.getAttribute("LOGIN_INFO")).get("LOGIN_USER");
		  pwd = DigestUtils.sha256Hex(pwd);
		  if(pwd.equals(customer.getPassword()))		// pwd  --> sha256으로
		  {
			  checked = "true";
		 } else {
			 checked="false";
		 }
		  return checked;
	}
	
	@RequestMapping("/nicknamecheck.do")
	public @ResponseBody String nicknameCheck(String nickname) {
		String result = "usable";
		for(Customer c : customerService.getAllCustomers()) {
			if(nickname.equals(c.getNickname())) {
				result = "exist";
				break;
			}
		}
		return result;
	}
	
	@RequestMapping("/getAnswer.do")
	public @ResponseBody ProductAns getProductAnswer(int proqueId) {
		ProductAns ans = ansService.getProductAnsByProQueId(proqueId);
		System.out.println(ans);
		return ansService.getProductAnsByProQueId(proqueId);
	}
	
}
