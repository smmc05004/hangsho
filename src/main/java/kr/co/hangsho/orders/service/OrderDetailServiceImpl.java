package kr.co.hangsho.orders.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.orders.mappers.OrderDetailMapper;
import kr.co.hangsho.orders.vo.OrderDetail;

@Service
public class OrderDetailServiceImpl implements  OrderDetailService{

	@Autowired
	OrderDetailMapper orderDetailMapper;

	@Override
	public List<OrderDetail> getOrderDetailsByCustomer(Map map) {
		return orderDetailMapper.getOrderDetailsByCustomer(map);
	}
	@Override
	public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
		
		return orderDetailMapper.getOrderDetailsByOrderId(orderId);
	}
	@Override
	public void addOrderDetail(OrderDetail orderDetail) {
		orderDetailMapper.addOrderDetail(orderDetail);
		
	}
}
