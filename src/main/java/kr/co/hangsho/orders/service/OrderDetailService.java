package kr.co.hangsho.orders.service;

import java.util.List;
import java.util.Map;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.orders.vo.OrderDetail;

public interface OrderDetailService {
	List<OrderDetail> getOrderDetailsByCustomer(Map map); 
	List<OrderDetail> getOrderDetailsByOrderId(int orderId);
	void addOrderDetail(OrderDetail orderDetail);
}
