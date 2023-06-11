package april.demo.service;

import java.util.List;

import april.demo.dto.Response;
import april.demo.entity.Product;

public interface ProductService {

	public Product getProduct(int id);
	
	public Product getProduct(String name);
	
	public Response addProduct(Product product);
	
	public Response deleteProduct(int id);
	
	public boolean updateProduct(Product product);
	
//	public List<Product> getProductsByKeyWord(String searchKeyWord);
	
	public List<Product> getProductsByType(int type);
	
	public List<Product> getAllProduct();
}
