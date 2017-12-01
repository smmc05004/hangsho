package kr.co.hangsho.deliveries.service;

import java.util.List;

import kr.co.hangsho.deliveries.vo.Delivery;

public interface DeliveryService {

	Delivery getDeliveryByCustomerId(int customerId);
	List<Delivery> getDeliveryListByCustomerId(int customerId);
	void addDelivery(Delivery delivery);
	Delivery getDeliveryByDeliveryId(int deliveryId);
	void updateDelivery(Delivery delivery);
}
