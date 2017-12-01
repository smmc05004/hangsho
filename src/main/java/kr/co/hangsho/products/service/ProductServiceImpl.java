package kr.co.hangsho.products.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.company.mappers.CompanyMapper;
import kr.co.hangsho.images.mappers.ImageMapper;
import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.item.mappers.ItemMapper;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.products.mappers.ProductMapper;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.web.criteria.Criteria;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ImageMapper imageMapper;
	
	@Autowired
	private ItemMapper itemMapper;
	
	@Override
	public void addNewProduct(Product product) {
		int imageNo = imageMapper.getSeq();
		Image image = product.getImage();
		image.setId(imageNo);
		imageMapper.addImage(image);
		
		int seq = productMapper.getSeq();
		product.setId(seq);
		
		productMapper.addProduct(product);
	}

	@Override
	public List<Product> getProductList(Criteria criteria) {
		return productMapper.getProductList(criteria);
	}

	@Override
	public Product getProductByProductNo(int productNo) {
		return productMapper.getProductByProductNo(productNo);
	}

	@Override
	public Product getProductDetail(int productNo) {
		return null;
	}

	@Override
	public List<Product> getProductsByComId(Map<String, Object> map) {
		return productMapper.getProductsByComId(map);
	}

	@Override
	public int getTotalRowsByCriteria(Map<String, Object> map) {
		return productMapper.getTotalRows(map);
	}

	@Override
	public List<Product> getProductsNameBySmaCateNo(int smaCateNo) {
		return productMapper.getProductsNameByNo(smaCateNo);
	}
	
	@Override
	public Product deleteProductByProductId(int productId) {
		
		List<Item> items = itemMapper.getItemsByProductId(productId);
		
		for (Item item : items) {

			int itemId = item.getId();
			itemMapper.deleteItemById(itemId);
			int itemImageId = item.getImage().getId();
			imageMapper.deleteImageById(itemImageId);
		}
		
		Product product = productMapper.getProductById(productId);
		int productImageId = product.getImage().getId();
		imageMapper.deleteImageById(productImageId);
		
		productMapper.deleteProductById(productId);
		
		return product;
	}

	@Override
	public void modifyProduct(Product product) {

		if (product.getShow().equals("N")) {
			product.setShow("Y");
		} else {
			product.setShow("N");
		}
		productMapper.modifyProduct(product);
		System.out.println("product is " + product);
	}

	@Override
	public Product getProductByProductId(int id) {
		return productMapper.getProductById(id);
	}

	@Override
	public void updateProduct(Product product) {
		
		if (product.getImage() != null) {
			int imageId = product.getImage().getId();
			Image image = imageMapper.getImageByNo(imageId);
			product.setImage(image);
		}
		productMapper.updateProduct(product);
	}
	
	@Override
	public List<Product> getProductsForIndex(int companyId) {
		return productMapper.getProductsForIndex(companyId);
	}

	
	@Override
	public List<Product> getProductBySmallCategoryNo(int no) {

		return productMapper.getProductBySmallCategoryNo(no);
	}


	@Override
	public List<Product> productSearch(String keyword) {
		return productMapper.productSearch(keyword);
	}

}
