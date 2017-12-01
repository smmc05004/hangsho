package kr.co.hangsho.categories.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.categories.mappers.CategoryMapper;
import kr.co.hangsho.categories.vo.MiddleCategory;

@Service
public class MiddleCategoryServiceImpl implements MiddleCategoryService {

	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<MiddleCategory> getMidCategoryByBigNo(int bigNo) {
		return categoryMapper.getMidCategoryByNo(bigNo);
		
	}
}
