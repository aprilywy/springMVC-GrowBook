package april.demo.dao;

import java.util.List;

import april.demo.entity.Cart;

public interface CartDao {

	Cart getCart(int userId, int productId);
	
	void addCart(Cart cart);
	
	boolean deleteCart(int userId,int productId);
	
	boolean updateCart(Cart cart);
	
	List<Cart> getCarts(int userId);
	
	boolean deleteCartByUser(int userId);
	
	boolean deleteCartByProduct(int productId);
}
