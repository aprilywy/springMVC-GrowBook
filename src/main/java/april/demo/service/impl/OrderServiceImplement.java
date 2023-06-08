package april.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import april.demo.dao.OrderDao;
import april.demo.entity.Order;
import april.demo.service.OrderService;

@Service
public class OrderServiceImplement implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public Order getOrder(int userId, int productId, String time) {
		return orderDao.getOrder(userId, productId, time);
	}

	@Override
	public void addOrder(Order order) {
		orderDao.addOrder(order);
	}

	@Override
	public boolean deleteOrder(int userId, int productId) {
		return orderDao.deleteOrder(userId, productId);
	}

	@Override
	public boolean updateOrder(Order order) {
		return orderDao.updateOrder(order);
	}

	@Override
	public List<Order> getOrdersByOrderStatus(int orderStatus) {
		return orderDao.getOrdersByOrderStatus(orderStatus);
	}

	@Override
	public List<Order> getOrders(int userId) {
		return orderDao.getOrders(userId);
	}

	@Override
	public List<Order> getAllOrders() {
		return orderDao.getAllOrders();
	}

	@Override
	public boolean getUserProductRecord(int userId, int productId) {
		return orderDao.getUserProductRecord(userId, productId);
	}

}
