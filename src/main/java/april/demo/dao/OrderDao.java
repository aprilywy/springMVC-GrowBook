package april.demo.dao;

import java.util.List;

import april.demo.entity.Order;

public interface OrderDao {

	Order getOrder(int userId, int productId, String time);
	
	void addOrder(Order order);
	
	boolean deleteOrder(int userId, int productId);
	
	boolean updateOrder(Order order);

	List<Order> getOrders(int userId);
	
	List<Order> getAllOrders();
	
	List<Order> getOrdersByOrderStatus(int orderStatus);
	
	boolean getUserProductRecord(int userId, int productId);
	
	boolean deleteOrderByUser(int userId);
	
	boolean deleteOrderByProductId(int productId);
}
