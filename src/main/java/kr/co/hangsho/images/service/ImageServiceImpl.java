package kr.co.hangsho.images.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.images.mappers.ImageMapper;
import kr.co.hangsho.images.vo.Image;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageMapper imageMapper;
	
	@Override
	public void addNewImage(Image image) {
		
		imageMapper.addImage(image);
	}

	@Override
	public int getSeqence() {
		return imageMapper.getSeq();
	}
	
	@Override
	public Image getImageByNo(int imageNo) {
		
		return imageMapper.getImageByNo(imageNo);
	}

	@Override
	public void updateImage(Image image) {
		imageMapper.updateImage(image);
	}
	

}
