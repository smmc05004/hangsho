package kr.co.hangsho.item.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.web.criteria.Criteria;

@Mapper
public interface ItemMapper {


	int getSeq();
	void addItem(Item item);
	Item getItemByItemNo(int itemNo);
	List<Item> getItems(Criteria criteria);
	List<Item> getItemsByComId(Map<String, Object> map);
	int getTotalRows(Map<String, Object> map);
	
	List<Item> getItemListByProductNo(int productNo);
	List<Item> getItemsByProductId(int productId);
	void deleteItemById(int Id);
	Item getItemById(int id);
	void updateItem(Item item);
	
	List<Item> getProductOptionsByProductId(int productNo);
	List<Item> getItemsForIndex(int companyId);
	void updateQty(@Param("qty") int qty, @Param("id") int id);
}

