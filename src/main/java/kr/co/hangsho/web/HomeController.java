package kr.co.hangsho.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangsho.admin.service.AdminService;
import kr.co.hangsho.products.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	ProductService productService;
	@Autowired
	AdminService adminService;

	@RequestMapping("/index.do")
	public String home(Model model) {
		model.addAttribute("mainSliders", adminService.getTodayMainSliderInformations());
		model.addAttribute("bestItems", adminService.getTodayBests());
		model.addAttribute("newArrivals", adminService.getTodayNewArrivals());
		model.addAttribute("populars", adminService.getTodayPopulars());
		return "index";
	}
	
	@RequestMapping("/search.do")
	public String home(Model model, String keyword) {
		model.addAttribute("searchList", productService.productSearch(keyword));
		return "search";
	}
}