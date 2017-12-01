package kr.co.hangsho.coupons.service;

import java.util.List;

import kr.co.hangsho.coupons.vo.Coupon;

public interface CouponService {

	List<Coupon> getCouponListByCustomerId(int customerId);
	int couponCountByCustomerId(int customerId);
//	Coupon getOldCoupon(int customerId);
	void couponUsed(int couponId);
	
}
