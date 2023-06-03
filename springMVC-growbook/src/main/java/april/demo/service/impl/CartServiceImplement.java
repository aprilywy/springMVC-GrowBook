package april.demo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import april.demo.entity.Cart;
import april.demo.service.CartService;

@Service
public class CartServiceImplement implements CartService {

	@Override
	public Cart getCart(int userId, int productId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addCart(Cart cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean deleteCart(int userId, int productId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateCart(Cart cart) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Cart> getCarts(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
