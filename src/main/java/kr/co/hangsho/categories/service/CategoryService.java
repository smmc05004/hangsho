package kr.co.hangsho.categories.service;

import java.util.List;

import kr.co.hangsho.categories.vo.SmallCategory;

public interface CategoryService {
	
	SmallCategory getCategory(int no);
	List<SmallCategory> getCategoryListByMiddle(int no);
}
