package kr.co.hangsho.orders.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangsho.coupons.service.CouponService;
import kr.co.hangsho.coupons.vo.Coupon;
import kr.co.hangsho.customers.services.CustomerService;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.deliveries.mappers.DeliveryMapper;
import kr.co.hangsho.deliveries.service.DeliveryService;
import kr.co.hangsho.deliveries.vo.Delivery;
import kr.co.hangsho.images.service.ImageService;
import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.item.web.form.ItemOrderForm;
import kr.co.hangsho.orders.service.OrderDetailService;
import kr.co.hangsho.orders.service.OrderService;
import kr.co.hangsho.orders.vo.Order;
import kr.co.hangsho.orders.vo.OrderDetail;
import kr.co.hangsho.orders.vo.OrderForm;
import kr.co.hangsho.products.service.ProductService;
import kr.co.hangsho.products.vo.Product;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private DeliveryService deliveryService;
	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping("/orderPage.do")
	public String orderPage(Model model, HttpSession session, ItemOrderForm itemOrderForm) {

		Map<String, Object> loginInfo = (Map) session.getAttribute("LOGIN_INFO");
	
		Customer customer = (Customer) loginInfo.get("LOGIN_USER");

		model.addAttribute("customer", customerService.getCustomerByNo(customer.getId()));

		model.addAttribute("coupons", couponService.getCouponListByCustomerId(customer.getId()));
		model.addAttribute("couponCount", couponService.couponCountByCustomerId(customer.getId()));

		List<Delivery> deliveries = deliveryService.getDeliveryListByCustomerId(customer.getId());

		for (Delivery d : deliveries) {
			d.setCustomer(customerService.getCustomerByNo(d.getCustomer().getId()));

		}
		
		model.addAttribute("quantity", itemOrderForm.getProqty());
		model.addAttribute("itemId", itemOrderForm.getItemId());
		
		List<Item> itemList = new ArrayList<Item>();
		for(int i : itemOrderForm.getItemId()) {
			itemList.add(itemService.getItemByItemNo(i));
		}
		

		for (Item i : itemList) {
			i.setProduct(productService.getProductByProductNo(i.getProduct().getId()));
			i.setImage(imageService.getImageByNo(i.getImage().getId()));
		}
		
		model.addAttribute("itemDetail", itemList);
		
		model.addAttribute("delivery", deliveries);

		Product product = new Product();
		product.setId(itemOrderForm.getProductId());

		// item = itemService.getItemByItemNo(item.getId());
		// item.setProduct(productService.getProductByProductNo(product.getId()));

		Image image = new Image();

		image.setId(productService.getProductByProductNo(itemOrderForm.getProductId()).getImage().getId());
		
		model.addAttribute("image", imageService.getImageByNo(image.getId()));

		return "/order";
	}

	@RequestMapping("/addOrder.do")
	public String addOrder(OrderForm orderForm, HttpSession session) {

		Map<String, Object> loginInfo = (Map) session.getAttribute("LOGIN_INFO");
		Customer customer = (Customer) loginInfo.get("LOGIN_USER");
		
		// 배송지 업데이트
		
		Delivery delivery = new Delivery();
		// 주문add
		Order order = new Order();
		order.setMessage(orderForm.getOrderMessage());
		order.setPrice(orderForm.getOrderPrice());
		order.setReceiver(orderForm.getOrderReceiver());
		order.setCustomer(customer);
		
		
		
		if(orderForm.getDeliveryId() != null) {
			delivery.setCustomer(customer);
			delivery.setId(orderForm.getDeliveryId());
			delivery.setMainAddress(orderForm.getMain());
			delivery.setTitle(orderForm.getDeliveryTitle());
			delivery.setPostalCode(orderForm.getPostalCode());
			delivery.setDetailAddress(orderForm.getDetail());
			deliveryService.updateDelivery(delivery);
			order.setDelivery(deliveryService.getDeliveryByDeliveryId(delivery.getId()));

		}

		orderService.addNewOrder(order);

		// 쿠폰업데이트
		Coupon coupon = new Coupon();
		coupon.setId(orderForm.getCouponId());
		couponService.couponUsed(coupon.getId());


		// 디테일 add
		for (int i = 0; i < orderForm.getItemId().length; i++) {
			int itemId = orderForm.getItemId()[i];
			int orderQty = orderForm.getOrderQuantity()[i];
			int productPrice = itemService.getItemByItemId(itemId).getSalePrice() * (100 - productService
					.getProductByProductId(itemService.getItemByItemId(itemId).getProduct().getId()).getDiscountRatio())
					/ 100;
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(order.getId());
			orderDetail.setItem(new Item());
			orderDetail.getItem().setId(itemId);
			orderDetail.setRealPrice(productPrice);
			orderDetail.setOrderQuantity(orderForm.getOrderQuantity()[i]);
			orderDetailService.addOrderDetail(orderDetail);
			// 제품 수량 업데이트
			itemService.updateQty(orderQty, itemId);
		}

		// 포인트 업데이트
		customerService.pointUpdate(orderForm.getCustomerPoint(), customer.getId());
		
		return "success";
	}

}