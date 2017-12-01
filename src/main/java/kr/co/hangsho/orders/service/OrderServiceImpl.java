package kr.co.hangsho.orders.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.customers.mappers.CustomerMapper;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.orders.mappers.OrderMapper;
import kr.co.hangsho.orders.vo.Order;
import kr.co.hangsho.products.mappers.ProductMapper;
import kr.co.hangsho.products.vo.Product;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper orderMapper;
	
	
	@Override
	public void addNewOrder(Order order) {
		order.setId(orderMapper.getSeq());
		order.setCondition("배송대기");
		orderMapper.addOrder(order);
	}

	@Override
	public List<Order> getAllOrders() {
		return orderMapper.getOrders();
	}

	@Override
	public Order getOrderById(int id) {
		
		return orderMapper.getOrder(id);
	}

	@Override
	public List<Order> getOrdersByCustomer(Map map) {
		
		return orderMapper.getOrdersByCustomer(map);
	}

}
