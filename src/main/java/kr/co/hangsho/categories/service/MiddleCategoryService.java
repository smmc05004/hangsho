package kr.co.hangsho.categories.service;

import java.util.List;

import kr.co.hangsho.categories.vo.MiddleCategory;

public interface MiddleCategoryService {
	
	List<MiddleCategory> getMidCategoryByBigNo(int bigNo); 
}
