package april.demo.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import april.demo.dao.CartDao;
import april.demo.entity.Cart;

@Repository
public class CartDaoImplement implements CartDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Cart getCart(int userId, int productId) {
		String hql = "from cart where userId = :userId and productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, userId);
		query.setParameter(1, productId);
		return (Cart) query.uniqueResult();
	}

	@Override
	public void addCart(Cart cart) {
		sessionFactory.getCurrentSession().save(cart);
	}

	@Override
	public boolean deleteCart(int userId, int productId) {
		String hql = "delete Cart where userId = :userId and productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, userId);
		query.setParameter(1, productId);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean updateCart(Cart cart) {
		String hql = "update Cart set productPrice = :productPrice, counts = :counts where suerId = :userId and productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, cart.getProductPrice());
		query.setParameter(1, cart.getCounts());
		query.setParameter(2, cart.getUserId());
		query.setParameter(3, cart.getProductId());
		return query.executeUpdate() > 0;
	}

	@Override
	public List<Cart> getCarts(int userId) {
		String hql = "from Cart where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, userId);
		return query.list();
	}

	@Override
	public boolean deleteCartByUser(int userId) {
		String hql = "delete Cart where userId = :userId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, userId);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean deleteCartByProduct(int productId) {
		String hql = "delete Cart where productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, productId);
		return query.executeUpdate() > 0;
	}

}
