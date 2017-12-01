package kr.co.hangsho.categories.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.categories.vo.MiddleCategory;
import kr.co.hangsho.categories.vo.SmallCategory;

@Mapper
public interface CategoryMapper {

	SmallCategory getCategory(int smallNo);
	List<MiddleCategory> getMidCategoryByNo(int bigNo);
	List<SmallCategory> getSmaCategoryByNo(int midNo);
	List<SmallCategory> getCategoryListByMiddle(int no);
}
