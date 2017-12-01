package kr.co.hangsho.orders.service;

import java.util.List;
import java.util.Map;

import kr.co.hangsho.orders.vo.Order;

public interface OrderService {

	void addNewOrder(Order order);
	List<Order> getAllOrders();
	Order getOrderById(int id);
	List<Order> getOrdersByCustomer(Map map);
}
