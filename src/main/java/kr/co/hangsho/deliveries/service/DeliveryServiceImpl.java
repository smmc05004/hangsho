package kr.co.hangsho.deliveries.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.deliveries.mappers.DeliveryMapper;
import kr.co.hangsho.deliveries.vo.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryMapper deliveryMapper;
	
	@Override
	public Delivery getDeliveryByCustomerId(int customerId) {

		return deliveryMapper.getDeliveryByCustomerId(customerId);
	}
	@Override
	public List<Delivery> getDeliveryListByCustomerId(int customerId) {
		
		return deliveryMapper.getDeliveryListByCustomerId(customerId);
	}
	@Override
	public void addDelivery(Delivery delivery) {
		delivery.setId(deliveryMapper.getSeq());
		
		deliveryMapper.addDelivery(delivery);
	}
	
	@Override
	public Delivery getDeliveryByDeliveryId(int deliveryId) {

		return deliveryMapper.getDeliveryByDeliveryId(deliveryId);
	}
	@Override
	public void updateDelivery(Delivery delivery) {
		deliveryMapper.updateDelivery(delivery);
		
	}
}
