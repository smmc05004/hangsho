package kr.co.hangsho.item.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.hangsho.categories.service.MiddleCategoryService;
import kr.co.hangsho.categories.service.SmallCategoryService;
import kr.co.hangsho.categories.vo.MiddleCategory;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.item.mappers.ItemMapper;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.stock.service.StockService;
import kr.co.hangsho.stock.vo.Stock;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/item")
public class ItemAjaxController {

	@Autowired
	private MiddleCategoryService middleCategoryService;
	
	@Autowired
	private SmallCategoryService smallCategoryService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StockService stockService;
	
	@RequestMapping("/getMidCate.do")
	@ResponseBody
	public List<MiddleCategory> getMidCategoryByBigCaNo(int bigCateNum) {
		List<MiddleCategory> middleCategories = middleCategoryService.getMidCategoryByBigNo(bigCateNum);
		return middleCategories;
	}
	
	@RequestMapping("/getSmaCate.do")
	@ResponseBody
	public List<SmallCategory> getsmaCategoryByMidCaNo(int midCateNum) {
		List<SmallCategory> smallCategories = smallCategoryService.getSmaCategoryByMidNo(midCateNum);
		return smallCategories;
	}
	
	@RequestMapping("/gettitle.do")
	@ResponseBody
	public List<Product> getProductNameBySmaCaNo(int smaCateNum) {
		List<Product> products = productService.getProductsNameBySmaCateNo(smaCateNum);
		return products;
		
	}
	
	@RequestMapping("/getItems.do")
	@ResponseBody
	public Map<String, Object> getProductListByCompanyId(HttpSession httpSession, Criteria criteria) {
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("companyId", companyId);
		
		int totalRows = itemService.getTotalRows(searchMap);
		criteria.setTotalRows(totalRows);
		
		List<Item> items = itemService.getItemsByCompanyId(searchMap);
		searchMap.remove("companyId");
		searchMap.put("items", items);
		
		return searchMap;
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public Map<String, Object> deleteItemById(int itemId, HttpSession httpSession, Criteria criteria) {
		
		itemService.deleteItemByItemId(itemId);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("companyId", companyId);
		
		int totalRows = itemService.getTotalRows(searchMap);
		criteria.setTotalRows(totalRows);
		
		List<Item> items = itemService.getItemsByCompanyId(searchMap);
		searchMap.remove("companyId");
		searchMap.put("items", items);
		
		return searchMap;
	}
	
	@RequestMapping("/accuStock.do")
	@ResponseBody
	public String accumulateStock(int itemId, int quantity, String reasons) {
		
		String result = "true";
		Stock stock = new Stock();
		Item item = new Item();
		item.setId(itemId);
		stock.setItem(item);
		stock.setQuantity(quantity);
		stock.setReasons(reasons);
		
		try {
			stockService.accumulateStockQuantity(stock);
		} catch (Exception e) {
			result.replace("true", "false");
			throw new RuntimeException("");
		}
		
		return result;
	}
	
}
