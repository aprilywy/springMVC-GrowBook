package april.demo.dao;

import java.util.List;

import april.demo.entity.Product;

public interface ProductDao {

	public Product getProduct(int id);
	
	public Product getProduct(String name);
	
	public void addProduct(Product product);
	
	public boolean deleteProduct(int id);
	
	public boolean updateProduct(Product product);
	
//	public List<Product> getProductsByKeyWord(String searchKeyWord);
	
	public List<Product> getProductsByType(int type);
	
	public List<Product> getAllProduct();
}
