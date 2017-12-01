package kr.co.hangsho.item.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.hangsho.item.vo.Item;

public interface ItemService {


	void addNewItem(Item item);
	Item getItemByItemNo(int itemNo);
	List<Item> getItemsByCompanyId(Map<String, Object> map);
	int getTotalRows(Map<String, Object> map);
	
	List<Item> getItemListByProductNo(int productNo);
	List<Item> getItemsByProductId(int productId);
	Item deleteItemByItemId(int itemId);
	Item getItemByItemId(int itemId);
	void updateItem(Item item);
	
	List<Item> getProductOptionsByProductId(int productNo);
	List<Item> getItemsForIndex(int companyId);
	void updateQty(@Param("qty") int qty, @Param("id") int id);
}

