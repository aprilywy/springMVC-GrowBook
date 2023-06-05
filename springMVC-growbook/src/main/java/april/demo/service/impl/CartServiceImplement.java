package april.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import april.demo.dao.CartDao;
import april.demo.entity.Cart;
import april.demo.service.CartService;

@Service
public class CartServiceImplement implements CartService {

	@Autowired
	private CartDao cartDao;
	
	@Override
	public Cart getCart(int userId, int productId) {
		return cartDao.getCart(userId, productId);
	}

	@Override
	public void addCart(Cart cart) {
		cartDao.addCart(cart);
	}

	@Override
	public boolean deleteCart(int userId, int productId) {
		return cartDao.deleteCart(userId, productId);
	}

	@Override
	public boolean updateCart(Cart cart) {
		return cartDao.updateCart(cart);
	}

	@Override
	public List<Cart> getCarts(int userId) {
		return cartDao.getCarts(userId);
	}

}
