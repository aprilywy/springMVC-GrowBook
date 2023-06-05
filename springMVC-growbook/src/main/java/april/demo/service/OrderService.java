package april.demo.service;

import java.util.List;

import april.demo.entity.Order;

public interface OrderService {

	public Order getOrder(int userId, int productId, String time);
	
	public void addOrder(Order order);
	
	public boolean deleteOrder(int userId, int productId);
	
	public boolean updateOrder(Order order);
	
	public List<Order> getOrdersByOrderStatus(int orderStatus);
	
	public List<Order> getOrders(int userId);
	
	public List<Order> getAllOrders();
	
	public boolean getUserProductRecord(int userId, int productId);
}
