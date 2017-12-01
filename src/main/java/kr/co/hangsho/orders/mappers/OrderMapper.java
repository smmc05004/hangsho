package kr.co.hangsho.orders.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.orders.vo.Order;

@Mapper
public interface OrderMapper {

	
	void addOrder(Order order);
	int getSeq();
	List<Order> getOrders();
	Order getOrder(int id);
	List<Order> getOrdersByCustomer(Map map);
}
