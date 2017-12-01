package kr.co.hangsho.categories.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.categories.mappers.CategoryMapper;
import kr.co.hangsho.categories.vo.SmallCategory;

@Service
public class SmallCategoryServiceImple implements SmallCategoryService {

	@Autowired
	private CategoryMapper categoryMapper;
	
	@Override
	public List<SmallCategory> getSmaCategoryByMidNo(int midNo) {
		return categoryMapper.getSmaCategoryByNo(midNo);
	}

}
