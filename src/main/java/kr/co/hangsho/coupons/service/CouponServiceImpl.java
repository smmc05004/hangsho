package kr.co.hangsho.coupons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.coupons.mappers.CouponMapper;
import kr.co.hangsho.coupons.vo.Coupon;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	CouponMapper couponMapper;
	
	@Override
	public List<Coupon> getCouponListByCustomerId(int customerId) {
		
		return couponMapper.getCouponListByCustomerId(customerId);
	}
	
	@Override
	public int couponCountByCustomerId(int customerId) {
		
		return couponMapper.couponCountByCustomerId(customerId);
	}
	
	@Override
	public void couponUsed(int couponId) {
		couponMapper.couponUsed(couponId);
	}

}
