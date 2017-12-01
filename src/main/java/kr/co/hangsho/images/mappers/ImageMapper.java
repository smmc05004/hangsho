package kr.co.hangsho.images.mappers;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.images.vo.Image;

@Mapper
public interface ImageMapper {

	int getSeq();
	void addImage(Image image);
	Image getImageByNo(int imageNo);
	void deleteImageById (int imageId);
	void updateImage(Image image);
	
}
