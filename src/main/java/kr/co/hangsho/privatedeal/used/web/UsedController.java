package kr.co.hangsho.privatedeal.used.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangsho.categories.service.MiddleCategoryService;
import kr.co.hangsho.categories.service.SmallCategoryService;
import kr.co.hangsho.categories.vo.MiddleCategory;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.privatedeal.service.PrivatedealService;
import kr.co.hangsho.privatedeal.vo.Comment;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/used")
public class UsedController {
	
	@Autowired
	PrivatedealService privatedealService;
	
	@Autowired
	MiddleCategoryService middleCategoryService;
	@Autowired
	SmallCategoryService smallCategoryService;
	
	@RequestMapping("/index.do")
	public String home(Criteria criteria, Model model) {
		
		criteria.setType("U");
		int totalRows = privatedealService.getTotalRows(criteria);
		criteria.setTotalRows(totalRows);
		
		List<Privatedeal> usedList = privatedealService.getMeronaList(criteria);
		
		if (criteria.getBc() != null) {
			model.addAttribute("middleCategories", middleCategoryService.getMidCategoryByBigNo(criteria.getBc()));			
		}
		if (criteria.getMc() != null) {
			model.addAttribute("smallCategories", smallCategoryService.getSmaCategoryByMidNo(criteria.getMc()));			
		}
		
		model.addAttribute("pagination", criteria);
		model.addAttribute("usedlist", usedList);
		
		return "/privatedeal/used/index";
	}	
	
	@RequestMapping("/detail.do")
	public String detail(int no, Model model, HttpSession httpSession) {
		
		privatedealService.clickedPlus(no);
		
		List<Comment> comments = privatedealService.getCommentsByBoardNo(no);
		int commentCount = privatedealService.getCommentCountByBoardNo(no);
		
		Privatedeal used = privatedealService.getMeronaByNo(no);
		
		List<MiddleCategory> middleCategories = middleCategoryService.getMidCategoryByBigNo(used.getSmallcategory().getMidCategory().getBigCategory().getId());
		List<SmallCategory> smallCategories = smallCategoryService.getSmaCategoryByMidNo(used.getSmallcategory().getMidCategory().getId());
						
		model.addAttribute("used", used);
		model.addAttribute("middleCategories", middleCategories);
		model.addAttribute("smallCategories", smallCategories);
		model.addAttribute("comments", comments);
		model.addAttribute("commentCount", commentCount);
		
		return "/privatedeal/used/detail";
	}
}
