package kr.co.hangsho.products.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.customers.services.CustomerService;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.images.service.ImageService;
import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.mappers.ProductQueMapper;
import kr.co.hangsho.products.service.ProductQueService;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.products.web.form.ProductQueForm;

@Controller
@RequestMapping("/hangshoproducts")
public class ProductQueController {

	@Autowired
	private ProductQueService productQueService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ItemService itemService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ImageService imageService;
	
	
	// 상품 상세페이지 메인화면 출력
	@RequestMapping("/detail.do")
	public String productDetail(int productId, Model model) {
	
		// 메인페이지 index.do에서 내가 클릭한 그 상품의 상세페이지를 넘겨줘야 하므로
		// 
		Product product = new Product();
		product.setId(productId);
			
			model.addAttribute("product", productService.getProductByProductNo(product.getId()));
			
			List<Item> proOptions = itemService.getProductOptionsByProductId(product.getId());
			//System.out.println(proOptions);
			for(Item i : proOptions) {
				i.setImage(imageService.getImageByNo(i.getImage().getId()));
			}
			model.addAttribute("productDetail", proOptions);
			System.out.println(proOptions);
			
			long minPrice = Long.MAX_VALUE;
			for(Item item : proOptions) {
				//System.out.println(item.getSalePrice());
				if(minPrice > item.getSalePrice()) {
					minPrice = item.getSalePrice();
				}
			}
				
			model.addAttribute("minPrice", minPrice);
			Image image = new Image();
		    image.setId(productService.getProductByProductNo(product.getId()).getImage().getId());
		    model.addAttribute("image", imageService.getImageByNo(image.getId()));

			return "detail";
			
	}
	
	@RequestMapping("/form.do")
	public String form() {
		return "hangshoproducts/form";
	}
	
	// 상품문의 Modal창 입력 폼 controller
	@RequestMapping("/add.do")
	public String addQue(ProductQueForm productQueForm, HttpSession session) throws IOException{
				
		Map<String, Object>loginInfo = (Map) session.getAttribute("LOGIN_INFO");
		Customer customer = (Customer) loginInfo.get("LOGIN_USER");
		//System.out.println(productQueForm.getProductId());
		
		ProductQue productQue = new ProductQue();
		Product product = new Product();
		product.setId(productQueForm.getProductId());
		
		BeanUtils.copyProperties(productQueForm, productQue);
		productQue.setProduct(product);
		
		customer = customerService.getCustomerByNo(customer.getId());
		productQue.setCustomer(customer);
		
		//System.out.println(productQue);
		productQueService.addProductQue(productQue);
	
		return "redirect:/hangshoproducts/detail.do?productId="+productQueForm.getProductId();
	}

}
