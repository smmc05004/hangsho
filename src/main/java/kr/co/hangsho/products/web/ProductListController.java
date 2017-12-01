package kr.co.hangsho.products.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangsho.categories.service.CategoryService;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.images.service.ImageService;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;

@Controller
public class ProductListController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ImageService imageService;
	
	@Autowired
	ItemService itemService;
	
	
	@RequestMapping("/productList.do")
	public String productList(int mc, Model model) {
		
		List<SmallCategory> smallCategoryList = categoryService.getCategoryListByMiddle(mc);
		List<Product> productList = new ArrayList<Product>();
		for(SmallCategory i : smallCategoryList) {

			productList = productService.getProductBySmallCategoryNo(i.getId());
			
		}
		List<Item> itemList = new ArrayList<Item>();
		
		for(Product i : productList) {
			
			i.setImage(imageService.getImageByNo(i.getImage().getId()));
			itemList = itemService.getItemListByProductNo(i.getId());
		}
		for(Item i : itemList) {
			i.setProduct(productService.getProductByProductNo(i.getProduct().getId()));
			i.getProduct().setImage(imageService.getImageByNo(i.getImage().getId()));;
		}
		System.out.println(itemList);
		
		model.addAttribute("item", itemList);
		model.addAttribute("productList", productList);
		
		
		
		return "category";
	}
}
