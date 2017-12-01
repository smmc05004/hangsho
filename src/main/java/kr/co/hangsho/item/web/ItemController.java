package kr.co.hangsho.item.web;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hangsho.categories.service.CategoryService;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.images.service.ImageService;
import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.item.mappers.ItemMapper;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.item.web.form.ItemForm;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.stock.mappers.StockMapper;
import kr.co.hangsho.stock.service.StockService;
import kr.co.hangsho.stock.vo.Stock;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Value("${images.upload.directory.prefix}")
	String uploadDrectoryPrefix;
	
	@Resource(name="imagePathMap")
	Map<String, String> imagePathMap;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StockService stockService;
	
	@RequestMapping("/form.do")
	public String form() {
		return "/item/register";
	}
	
	@RequestMapping("/add.do")
	public String add(ItemForm itemForm) throws IOException {
		
		Item item = new Item();
		BeanUtils.copyProperties(itemForm, item);
		
		Product product = new Product();
		product.setId(itemForm.getProduct());
		item.setProduct(product);
		
		MultipartFile imageFile = itemForm.getImagefile();
		String filename = imageFile.getOriginalFilename();
		
		String imagePath = imagePathMap.get(String.valueOf(itemForm.getSmallCategory())) + filename;
		String savePath = uploadDrectoryPrefix +  imagePath;
		
		Image image = new Image();
		image.setPath(imagePath);
		item.setImage(image);
		
		FileCopyUtils.copy(imageFile.getBytes(), new FileOutputStream(savePath));
		
		itemService.addNewItem(item);
		
		return "redirect:../item/list.do";
	}
	@RequestMapping("/list.do")
	public String list() {
		return "/item/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(int itemId, Model model) {
		
		Item item = itemService.getItemByItemId(itemId);
		
		int imageId = item.getImage().getId();
		Image image = imageService.getImageByNo(imageId);
		
		item.setImage(image);
		
		int productId = item.getProduct().getId();
		Product product = productService.getProductByProductId(productId);
		
		int smallCategoryId = product.getSmallCategory().getId();
		SmallCategory smallCategory = categoryService.getCategory(smallCategoryId);
		product.setSmallCategory(smallCategory);
		item.setProduct(product);
		
		List<Stock> stocks = stockService.getStocksByItemId(itemId);
		
		model.addAttribute("stocks", stocks);
		model.addAttribute("item", item);
		
		return "/item/detail";
	}
	
	@RequestMapping("/modifyForm.do")
	public String modify(int itemId, Model model) {
		
		Item item = itemService.getItemByItemId(itemId);
		
		int imageId = item.getImage().getId();
		Image image = imageService.getImageByNo(imageId);
		item.setImage(image);
		
		int productId = item.getProduct().getId();
		Product product = productService.getProductByProductId(productId);
		
		int smallCategoryId = product.getSmallCategory().getId();
		SmallCategory smallCategory = categoryService.getCategory(smallCategoryId);
		product.setSmallCategory(smallCategory);
		
		item.setProduct(product);
		
		model.addAttribute("item", item);
		
		return "/item/modify";
	}
	@RequestMapping("/modify.do")
	public String modifyItem(ItemForm itemForm, int itemId) throws IOException {
		
		Item item = new Item();
		BeanUtils.copyProperties(itemForm, item);
		Product product = new Product();
		product.setId(itemForm.getProduct());
		item.setProduct(product);
		item.setId(itemId);

		if (!itemForm.getImagefile().isEmpty()) {
			
			MultipartFile imageFile = itemForm.getImagefile();
			String filename = imageFile.getOriginalFilename();
			
			String imagePath = imagePathMap.get(String.valueOf(itemForm.getSmallCategory())) + filename;
			String savePath = uploadDrectoryPrefix +  imagePath;
			
			int imageId = itemService.getItemByItemId(item.getId()).getImage().getId();
			
			Image image = new Image();
			image.setId(imageId);
			image.setPath(imagePath);
			
			FileCopyUtils.copy(imageFile.getBytes(), new FileOutputStream(savePath));
			imageService.updateImage(image);
		}
		itemService.updateItem(item);
		
		return "redirect:/item/list.do";
	}
	
	
}
