package kr.co.hangsho.categories.service;

import java.util.List;
import kr.co.hangsho.categories.vo.SmallCategory;

public interface SmallCategoryService {

	List<SmallCategory> getSmaCategoryByMidNo(int midNo);
}
