package kr.co.hangsho.deliveries.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.deliveries.vo.Delivery;

@Mapper
public interface DeliveryMapper {

	Delivery getDeliveryByCustomerId(int customerId);
	List<Delivery> getDeliveryListByCustomerId(int customerId);
	int getSeq();
	void addDelivery(Delivery delivery);
	Delivery getDeliveryByDeliveryId(int deliveryId);
	void updateDelivery(Delivery delivery);
}
