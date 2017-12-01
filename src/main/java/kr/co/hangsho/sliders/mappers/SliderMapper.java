package kr.co.hangsho.sliders.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.sliders.vo.Slider;
import kr.co.hangsho.sliders.vo.SliderInformation;

@Mapper
public interface SliderMapper {
	
	List<Slider> getSliders();
	List<SliderInformation> getSliderInfoById(int sliderId);
	Slider getSliderById(int sliderId);
	int getSliderSeq();
	void addSlider(Slider slider);
	void addSliderInfo(SliderInformation sliderInfo);
	void deleteSlider(int sliderId);
	List<SliderInformation> getTodayMainSliderInformations();
	List<SliderInformation> getTodayBests();
	List<SliderInformation> getTodayNewArrivals();
	List<SliderInformation> getTodayPopulars();
	
}
