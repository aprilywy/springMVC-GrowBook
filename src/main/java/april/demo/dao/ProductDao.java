package april.demo.dao;

import java.util.List;

import april.demo.entity.Product;

public interface ProductDao {

	Product getProduct(int id);
	
	Product getProduct(String name);
	
	void addProduct(Product product);
	
	boolean deleteProduct(int id);
	
	boolean updateProduct(Product product);
	
//	List<Product> getProductsByKeyWord(String searchKeyWord);
	
	List<Product> getProductsByType(int type);
	
	List<Product> getAllProduct();
}
