package april.demo.dao;

import java.util.List;

import april.demo.entity.Cart;

public interface CartDao {

	public Cart cart(int userId, int ProductId);
	
	public void addCart(Cart cart);
	
	public boolean deleteCart(int userId,int productId);
	
	public boolean updateCart(Cart cart);
	
	public List<Cart> getCarts(int userId);
}
