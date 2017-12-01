package kr.co.hangsho.admin.service;

import java.util.List;

import kr.co.hangsho.admin.vo.LoginHistory;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.sliders.vo.Slider;
import kr.co.hangsho.sliders.vo.SliderInformation;
import kr.co.hangsho.web.criteria.Criteria;

public interface AdminService {
	
	List<Product> getProducts(Criteria criteria);		// 관리자용 프로덕트 리스트
	List<Item> getItems(Criteria criteria);
	List<Product> getProductList(Criteria criteria);		// product_show = 'Y'
	List<Slider> getSliders();
	List<SliderInformation> getSliderInfoListById(int sliderId);
	Slider getSliderById(int sliderId);
	int getSliderSeq();
	void addSlider(Slider slider);
	void addSliderInfo(SliderInformation sliderInfo);
	void deleteSlider(int sliderId);
	Product getProductByProductId(int proId);
	void addLoginHistory(LoginHistory loginHistory);
	List<SliderInformation> getTodayMainSliderInformations();
	List<SliderInformation> getTodayBests();
	List<SliderInformation> getTodayNewArrivals();
	List<SliderInformation> getTodayPopulars();
	
}
