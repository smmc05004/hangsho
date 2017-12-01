package kr.co.hangsho.orders.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.orders.vo.OrderDetail;

@Mapper
public interface OrderDetailMapper {

	List<OrderDetail> getOrderDetailsByCustomer(Map map);
	List<OrderDetail> getOrderDetailsByOrderId(int orderId);
	void addOrderDetail(OrderDetail orderDetail);
}
