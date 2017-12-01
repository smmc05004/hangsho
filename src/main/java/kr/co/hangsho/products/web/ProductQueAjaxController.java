package kr.co.hangsho.products.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.service.ProductQueService;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.review.service.ReviewService;
import kr.co.hangsho.review.vo.Review;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
public class ProductQueAjaxController {

	@Autowired
	private ProductQueService productQueService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService;
	
	// 상품문의 제목 하나 당 나오는 내용
	@RequestMapping("/hangshoproducts/getQueContent.do")
	@ResponseBody
	public ProductQue getProductQueContent(int id) {
		ProductQue productQue = productQueService.getProductQueContent(id);
		return productQue;
	}
	
	// 상품문의 리스트 Ajax 처리
	@RequestMapping("/hangshoproducts/getProquelist.do")
	@ResponseBody
	public Map<String, Object> getProductQuelist(Model model,int productId, Criteria criteria) {
		
		
		Map<String, Object> proQueMap = new HashMap<String, Object>();
		proQueMap.put("criteria", criteria);
		proQueMap.put("productId", productId);
		
		int totalRows = productQueService.getTotalRowsByProductId(proQueMap);
		criteria.setTotalRows(totalRows);
		
		List<ProductQue> proQues = productQueService.getProductQuessByProductId(proQueMap);
		proQueMap.put("productques", proQues);

		return proQueMap;	
	}
	
	@RequestMapping("/hangshoproducts/getProDetail.do")
	@ResponseBody
	public Item getItemDetail(int itemId) {
		Item item = itemService.getItemByItemId(itemId);
		
		return item;
	}

	@RequestMapping("/hangshoproducts/getReviewList.do")
	@ResponseBody
	public Map getReviewListByProductId(int productId, Criteria criteria) {
		
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("criteria", criteria);
		reviewMap.put("productId", productId);
		
		int totalRows = reviewService.getTotalRowsByProIdMap(reviewMap);
		criteria.setTotalRows(totalRows);
		
		List<Review> reviews = reviewService.getRivewsByProIdMap(reviewMap);
		reviewMap.put("reviews", reviews);
		
		return reviewMap;
	}
	
}
