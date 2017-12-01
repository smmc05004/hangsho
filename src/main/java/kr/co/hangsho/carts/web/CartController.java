package kr.co.hangsho.carts.web;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangsho.carts.service.CartService;
import kr.co.hangsho.carts.vo.CartDetail;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.item.web.form.ItemOrderForm;
import kr.co.hangsho.products.vo.Product;

@Controller
@RequestMapping("/cart")
public class CartController {


	@Autowired
	CartService cartService;
	
	@RequestMapping("/updateCart.do")
	public String updateCart(HttpSession session, ItemOrderForm itemOrderForm) {
		Customer customer = (Customer) ((Map) session.getAttribute("LOGIN_INFO")).get("LOGIN_USER");		
//		CartDetail에 cart 카트에 담을 물품의 정보를 담음.
		List<CartDetail> cartDetails = new ArrayList();
		int itemIds[] = itemOrderForm.getItemId();
		int proQtys[] = itemOrderForm.getProqty();
		

		
		for(int i = 0; i < itemIds.length; i ++) {
			CartDetail cartDetail = new CartDetail();
			Item item = new Item();
			item.setId(itemIds[i]);
			cartDetail.setItem(item);
			cartDetail.setProductQuantity(proQtys[i]);
			cartDetails.add(cartDetail);
		}
		cartService.addItemToCart(cartDetails, customer);
		
		
		return "redirect:/cart/cart.do";
	}
	
	@RequestMapping("/cart.do")
	public String CartPage(Model model, HttpSession session) {
		Customer customer = (Customer) ((Map) session.getAttribute("LOGIN_INFO")).get("LOGIN_USER");		
		Set<Product> productSet = new HashSet<Product>();
		List<CartDetail>cartDetails = cartService.getItemLists(customer);
		
//		product 를 저장하기
		for(CartDetail cd : cartDetails) {
			productSet.add(cd.getItem().getProduct());
		}
		
		
		model.addAttribute("products",productSet);
		model.addAttribute("cartDetails", cartDetails);
		
		return "/cart";
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(HttpSession session) {
		Customer customer = (Customer) ((Map) session.getAttribute("LOGIN_INFO")).get("LOGIN_USER");		
		
		cartService.deleteCart(customer);

		return "redirect:/cart/cart.do";
	}

}