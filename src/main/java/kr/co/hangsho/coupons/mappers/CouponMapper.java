package kr.co.hangsho.coupons.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.coupons.vo.Coupon;

@Mapper
public interface CouponMapper {

	int getSeq();
	List<Coupon> getCouponListByCustomerId(int customerId);
	int couponCountByCustomerId(int customerId);
//	Coupon getOldCoupon(int customerId);
	void couponUsed(int couponId);
}
