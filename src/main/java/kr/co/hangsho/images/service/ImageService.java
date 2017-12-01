package kr.co.hangsho.images.service;

import kr.co.hangsho.images.vo.Image;

public interface ImageService {

	void addNewImage(Image image);
	int getSeqence();
	Image getImageByNo(int imageNo);
	void updateImage(Image image);
	
}
