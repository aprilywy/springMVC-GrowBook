package april.demo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import april.demo.dao.CartDao;
import april.demo.entity.Cart;

@Repository
public class CartDaoImplement implements CartDao {

	@Override
	public Cart cart(int userId, int ProductId) {
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
