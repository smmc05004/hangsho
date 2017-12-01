package kr.co.hangsho.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.admin.mappers.AdminMapper;
import kr.co.hangsho.admin.vo.LoginHistory;
import kr.co.hangsho.categories.mappers.CategoryMapper;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.images.mappers.ImageMapper;
import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.item.mappers.ItemMapper;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.mappers.ProductMapper;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.sliders.mappers.SliderMapper;
import kr.co.hangsho.sliders.vo.Slider;
import kr.co.hangsho.sliders.vo.SliderInformation;
import kr.co.hangsho.web.criteria.Criteria;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Autowired
	ItemMapper itemMapper;
	
	@Autowired
	SliderMapper sliderMapper;
	
	@Autowired
	ImageMapper imageMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<Product> getProducts(Criteria criteria) {
		List<Product> products = productMapper.getProductsForAdmin(criteria);
		
		for(Product product : products) {
			SmallCategory category =  categoryMapper.getCategory(product.getSmallCategory().getId());
			product.setSmallCategory(category);
		}
		
		return products;
	}

	@Override
	public List<Item> getItems(Criteria criteria) {
		return itemMapper.getItems(criteria);
	}
	
	public List<Product> getProductList(Criteria criteria) {
		List<Product> products = productMapper.getProductList(criteria);
		
		for(Product product : products) {
			SmallCategory category = categoryMapper.getCategory(product.getSmallCategory().getId());
			product.setSmallCategory(category);
		}
		return products;
	}

	@Override
	public List<Slider> getSliders() {
		
		return sliderMapper.getSliders();
	}

	@Override
	public List<SliderInformation> getSliderInfoListById(int sliderId) {
		List<SliderInformation> sliderInfos = sliderMapper.getSliderInfoById(sliderId);
		for(SliderInformation sliderInfo : sliderInfos) {
			SmallCategory category = categoryMapper.getCategory(sliderInfo.getProduct().getSmallCategory().getId());
			sliderInfo.getProduct().setSmallCategory(category);
		}
		return sliderInfos;
	}

	@Override
	public Slider getSliderById(int sliderId) {
		return sliderMapper.getSliderById(sliderId);
	}

	@Override
	public int getSliderSeq() {
		return sliderMapper.getSliderSeq();
	}

	@Override
	public void addSlider(Slider slider) {
		sliderMapper.addSlider(slider);
	}

	@Override
	public void addSliderInfo(SliderInformation sliderInfo) {
		sliderMapper.addSliderInfo(sliderInfo);
	}

	@Override
	public void deleteSlider(int sliderId) {
		sliderMapper.deleteSlider(sliderId);
		
	}

	@Override
	public Product getProductByProductId(int proId) {
		Product product = productMapper.getProductById(proId);
		SmallCategory category = categoryMapper.getCategory(product.getSmallCategory().getId());
		Image image = imageMapper.getImageByNo(product.getImage().getId());
		product.setSmallCategory(category);
		product.setImage(image);
		System.out.println(product);
		return product;
	}


	@Override
	public void addLoginHistory(LoginHistory loginHistory) {
		adminMapper.addLoginHistory(loginHistory);
	}

	@Override
	public List<SliderInformation> getTodayMainSliderInformations() {
		return sliderMapper.getTodayMainSliderInformations();
	}
	@Override
	public List<SliderInformation> getTodayBests() {
		// TODO Auto-generated method stub
		return sliderMapper.getTodayBests();
	}

	@Override
	public List<SliderInformation> getTodayNewArrivals() {
		// TODO Auto-generated method stub
		return sliderMapper.getTodayNewArrivals();
	}

	@Override
	public List<SliderInformation> getTodayPopulars() {
		// TODO Auto-generated method stub
		return sliderMapper.getTodayPopulars();
	}


}
