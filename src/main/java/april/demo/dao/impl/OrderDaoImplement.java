package april.demo.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import april.demo.dao.OrderDao;
import april.demo.entity.Order;

@Repository
public class OrderDaoImplement implements OrderDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Order getOrder(int userId, int productId, String time) {
		String hql = "from Order where userId = :userId and productId = :productId and time = :time";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		query.setParameter("time", time);
		return (Order) query.uniqueResult();
	}

	@Override
	public void addOrder(Order order) {
		sessionFactory.getCurrentSession().save(order);
	}

	@Override
	public boolean deleteOrder(int userId, int productId) {
		String hql = "delete Order where userId = :userId and productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean updateOrder(Order order) {
		String hql = "update Order set orderStatus = :orderStatus where userId = :userId and productId = productId and time = :time";
		String sql = "update Order set order_status="+order.getOrderStatus()+" where user_id="+order.getUserId()+" and product_id="+order.getProductId()+" and time='"+order.getTime()+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.executeUpdate() > 0;
	}

	@Override
	public List<Order> getOrders(int userId) {
		String hql = "from Order where userId = :userId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		return query.list();
	}

	@Override
	public List<Order> getAllOrders() {
		String hql = "from Order";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	public List<Order> getOrdersByOrderStatus(int orderStatus) {
		String hql = "from Order where orderStatus = :orderStatus";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("orderStatus", orderStatus);
		return query.list();
	}

	@Override
	public boolean getUserProductRecord(int userId, int productId) {
		String hql = "from Order where userId = :userId and productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		return query.list().size() > 0;
	}

	@Override
	public boolean deleteOrderByUser(int userId) {
		String hql = "delete Order where userId = :userId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean deleteOrderByProductId(int productId) {
		String hql = "delete Order where productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("productId", productId);
		return query.executeUpdate() > 0;
	}

}
