package april.demo.service;

import java.util.List;

import april.demo.entity.Cart;

public interface CartService {

	public Cart getCart(int userId, int productId);
	
	public void addCart(Cart cart);
	
	public boolean deleteCart(int userId, int productId);
	
	public boolean updateCart(Cart cart);
	
	public List<Cart> getCarts(int userId);
}
