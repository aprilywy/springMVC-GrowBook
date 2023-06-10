package april.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import april.demo.entity.Order;
import april.demo.entity.Product;
import april.demo.service.OrderService;
import april.demo.service.ProductService;

@Controller
public class OrderController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/order")
	public String order() {
		return "order";
	}
	
	@RequestMapping(value = "/order_handle")
	public String order_handle() {
		return "order_handle";
	}
	
	@RequestMapping(value = "/addOrder", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addOrder(int userId, int productId, int counts) {
		System.out.println("我添加了" + userId + " " + productId);
		String result = null;
		Product product = productService.getProduct(productId);
		if (counts <= product.getCounts()) {
			Order order = new Order();
			order.setUserId(userId);
			order.setProductId(productId);
			order.setProductPrice(product.getPrice() * counts);
			order.setCounts(counts);
			order.setOrderStatus(0);
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
			order.setTime(sf.format(date));
			product.setCounts(product.getCounts() - counts);
			productService.updateProduct(product);
			orderService.addOrder(order);
			result = "success";
		}
		Map<String, Object> resultMap = new Hashtable<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/changeOrder", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeOrder(int userId, int productId, String time, int orderStatus) {
		System.out.println("我接收了" + userId + " " + productId + " " + time + " " + orderStatus);
		Order order = orderService.getOrder(userId, productId, time);
		System.out.println("我取得到" + order.getTime());
		order.setOrderStatus(orderStatus);
		orderService.updateOrder(order);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		System.out.println("成功回傳了");
		return resultMap;
	}
	
	@RequestMapping(value = "/getOrders", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getOrders(int userId) {
		List<Order> orderList = orderService.getOrders(userId);
		Gson gson = new Gson();
		String orders = gson.toJson(orderList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", orders);
		return resultMap;
	}
	
	@RequestMapping(value = "/getOrdersByOrderStatus", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getOrdersByOrderStatus(int orderStatus) {
		List<Order> orderList = orderService.getOrdersByOrderStatus(orderStatus);
		Gson gson = new Gson();
		String orders = gson.toJson(orderList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result",orders);
		return resultMap;
	}
	
	@RequestMapping(value = "/getAllOrders",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllOrders() {
		List<Order> orderList = orderService.getAllOrders();
		Gson gson = new Gson();
		String orders = gson.toJson(orderList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", orders);
		return resultMap;
	}
	
	@RequestMapping(value = "/getUserProductRecord", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUserProductRecord(int userId, int productId) {
		String result = "false";
		if (orderService.getUserProductRecord(userId, productId)) {
			result = "true";
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}
}
