package kr.co.hangsho.privatedeal.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.categories.service.MiddleCategoryService;
import kr.co.hangsho.categories.service.SmallCategoryService;
import kr.co.hangsho.categories.vo.MiddleCategory;
import kr.co.hangsho.categories.vo.SmallCategory;

@Controller
public class FormAjaxController {
	
	@Autowired
	private MiddleCategoryService middleCategoryService;
	
	@Autowired
	private SmallCategoryService smallCategoryService;
	
	@RequestMapping("/getmiddle.do")
	@ResponseBody
	public List<MiddleCategory> getMidCatByBigCatNo(int bigcategory) {
		List<MiddleCategory> middleCategories = middleCategoryService.getMidCategoryByBigNo(bigcategory);
		return middleCategories;
	}
	
	@RequestMapping("/getsmall.do")
	@ResponseBody
	public List<SmallCategory> getSmallCatByMidCatNo(int middlecategory) {
		List<SmallCategory> smallCategories = smallCategoryService.getSmaCategoryByMidNo(middlecategory);
		return smallCategories;
	}
}
