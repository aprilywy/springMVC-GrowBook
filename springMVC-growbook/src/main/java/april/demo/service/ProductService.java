package april.demo.service;

import java.util.List;

import april.demo.dto.Response;
import april.demo.entity.Product;

public interface ProductService {

	public Product getProduct(int id);
	
	public Product getProduct(String name);
	
	public void addProduct(Product product);
	
	Response deleteProduct(int id);
	
	public boolean updaateProduct(Product product);
	
//	public List<Product> getProductsByKeyWord(String searchKeyWord);
	
	public List<Product> getProductsByType(int type);
	
	public List<Product> getAllProduct();
}
