package kr.co.hangsho.products.web;

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
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.service.ProductQueService;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.products.web.form.ProductForm;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Value("${images.upload.directory.prefix}")
	String uploadDirectoryPrefix;
	
	@Resource(name="imagePathMap")
	Map<String, String> imagePathMap;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductQueService productQueService;
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/form.do")
	public String form() {
		return "/products/register";
	}
	
	@RequestMapping("/add.do")
	public String add(ProductForm productForm, HttpSession httpSession) throws IOException {
		
		Product products = new Product();
		BeanUtils.copyProperties(productForm, products);
		
		SmallCategory smallCategory = new SmallCategory();
		smallCategory.setId(productForm.getSmallCategory());
		products.setSmallCategory(smallCategory);
		
		MultipartFile imageFile = productForm.getImagefile();
		String filename = imageFile.getOriginalFilename();
		
		String imagePath = imagePathMap.get(String.valueOf(smallCategory.getId())) + filename;
		String savePath = uploadDirectoryPrefix +  imagePath;
		
		Image image = new Image();
		image.setPath(imagePath);
		products.setImage(image);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		products.setCompany(company);
		
		FileCopyUtils.copy(imageFile.getBytes(), new FileOutputStream(savePath));
		
		productService.addNewProduct(products);
		
		return "redirect:list.do";
	}

	@RequestMapping("/list.do")
	public String list() {
		
		return "/products/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(int productId, Model model) {
		
		Product product = productService.getProductByProductId(productId);
		int productImageId = product.getImage().getId();
		
		Image mainImage =  imageService.getImageByNo(productImageId);
		product.setImage(mainImage);
		int smallCategoryId = product.getSmallCategory().getId();
		SmallCategory smallCategory = categoryService.getCategory(smallCategoryId);
		product.setSmallCategory(smallCategory);
		
		model.addAttribute("product", product);
		
		List<Item> items = itemService.getItemsByProductId(productId);
		model.addAttribute("items", items);
		return "/products/detail";
	}
	
	@RequestMapping("/modifyForm.do")
	public String modify(int productId, Model model) {
	
		Product product = productService.getProductByProductId(productId);
		
		int productImageId = product.getImage().getId();
		Image mainImage =  imageService.getImageByNo(productImageId);
		product.setImage(mainImage);

		int smallCategoryId = product.getSmallCategory().getId();
		SmallCategory smallCategory = categoryService.getCategory(smallCategoryId);
		product.setSmallCategory(smallCategory);
		
		model.addAttribute("product", product);
		
		return "/products/modify";
	}

	@RequestMapping("/modify.do")
	public String modifyProduct(ProductForm productForm, int productId) throws IOException {
		Product product = new Product();
		BeanUtils.copyProperties(productForm, product);
		
		SmallCategory smallCategory = new SmallCategory();
		smallCategory.setId(productForm.getSmallCategory());
		product.setSmallCategory(smallCategory);
		product.setId(productId);
		
		if (!productForm.getImagefile().isEmpty()) {
			
			MultipartFile imageFile = productForm.getImagefile();
			String filename = imageFile.getOriginalFilename();
			
			String imagePath = imagePathMap.get(String.valueOf(smallCategory.getId())) + filename;
			String savePath = uploadDirectoryPrefix +  imagePath;
			
			int imageId = productService.getProductByProductId(product.getId()).getImage().getId();
			
			Image image = new Image();
			image.setId(imageId);
			image.setPath(imagePath);
			
			FileCopyUtils.copy(imageFile.getBytes(), new FileOutputStream(savePath));
			imageService.updateImage(image);
		}
		productService.updateProduct(product);
		
		return "redirect:/product/list.do";
	}
	
	@RequestMapping("/qna.do")
	public String qnaList(HttpSession httpSession, Criteria criteria, Model model) {
		
		Map<String, Object> loginInfo  = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("companyId", companyId);
		
		int totalRows = productQueService.getTotalRowsByCompanyId(searchMap);
		criteria.setTotalRows(totalRows);
		
		model.addAttribute("criteria", criteria);

		List<ProductQue> productQues = productQueService.getProductQuessByComapnyId(searchMap);
		searchMap.remove("companyId");
		searchMap.put("productQues", productQues);
		
		model.addAttribute("searchMap", searchMap);
		
		return "/products/qnaList";
	}
}
