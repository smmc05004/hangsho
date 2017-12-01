package kr.co.hangsho.privatedeal.merona.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hangsho.categories.service.MiddleCategoryService;
import kr.co.hangsho.categories.service.SmallCategoryService;
import kr.co.hangsho.categories.vo.MiddleCategory;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.privatedeal.service.PrivatedealService;
import kr.co.hangsho.privatedeal.vo.Comment;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.privatedeal.web.form.PrivatedealForm;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/merona")
public class MeronaController {
	
	@Autowired
	PrivatedealService privatedealService;
	
	@Autowired
	MiddleCategoryService middleCategoryService;
	@Autowired
	SmallCategoryService smallCategoryService;
	
	@RequestMapping("/index.do")
	public String home(Criteria criteria, Model model) {
		
		criteria.setType("M");
		int totalRows = privatedealService.getTotalRows(criteria);
		criteria.setTotalRows(totalRows);
		
		List<Privatedeal> meronaList = privatedealService.getMeronaList(criteria);
		
		if (criteria.getBc() != null) {
			model.addAttribute("middleCategories", middleCategoryService.getMidCategoryByBigNo(criteria.getBc()));			
		}
		if (criteria.getMc() != null) {
			model.addAttribute("smallCategories", smallCategoryService.getSmaCategoryByMidNo(criteria.getMc()));			
		}
		
		model.addAttribute("pagination", criteria);
		model.addAttribute("meronalist", meronaList);
		
		return "/privatedeal/merona/index";
	}
	
	@RequestMapping("/detail.do")
	public String detail(int no, Model model, HttpSession httpSession) {
		
		privatedealService.clickedPlus(no);
		
		List<Comment> comments = privatedealService.getCommentsByBoardNo(no);
		int commentCount = privatedealService.getCommentCountByBoardNo(no);
		
		Privatedeal merona = privatedealService.getMeronaByNo(no);
		
		List<MiddleCategory> middleCategories = middleCategoryService.getMidCategoryByBigNo(merona.getSmallcategory().getMidCategory().getBigCategory().getId());
		List<SmallCategory> smallCategories = smallCategoryService.getSmaCategoryByMidNo(merona.getSmallcategory().getMidCategory().getId());
						
		model.addAttribute("merona", merona);
		model.addAttribute("middleCategories", middleCategories);
		model.addAttribute("smallCategories", smallCategories);
		model.addAttribute("comments", comments);
		model.addAttribute("commentCount", commentCount);
		
		return "/privatedeal/merona/detail";
	}
	
	@RequestMapping("/dpi.do")
	public String dpim(int no) {
		
		privatedealService.dpiUpdateByBoardNo(no);
		
		return "redirect:/merona/detail.do?no=" + no;
	}
	
	@RequestMapping("/di.do")
	public String dim(int no) {
		
		privatedealService.diUpdateByBoardNo(no);
		
		return "redirect:/merona/detail.do?no=" + no;
	}
	
	@RequestMapping("/dc.do")
	public String dcm(int no) {
		
		privatedealService.dcUpdateByBoardNo(no);
		
		return "redirect:/merona/detail.do?no=" + no;
	}
	
	@RequestMapping("/delete.do")
	public String delete(int no) {
		
		privatedealService.deleteBoardByBoardNo(no);
		
		return "redirect:/merona/index.do";
	}
	
	@RequestMapping("/deleteU.do")
	public String deleteU(int no) {
		
		privatedealService.deleteBoardByBoardNo(no);
		
		return "redirect:/used/index.do";
	}	
	
}