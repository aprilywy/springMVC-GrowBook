package april.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import april.demo.entity.Cart;
import april.demo.service.CartService;
import april.demo.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value = "/cart")
	public String cart() {
		return "cart";
	}
	
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addCart(int userId, int productId, int counts) {
		System.out.println("數量為" + counts);
		Cart cart = cartService.getCart(userId, productId);
		if (cart == null) {
			Cart cart1 = new Cart();
			cart1.setUserId(userId);
			cart1.setProductId(productId);
			cart1.setCounts(counts);
			cart1.setProductPrice(productService.getProduct(productId).getPrice() * counts);
			cartService.addCart(cart1);
		} else {
			cart.setCounts(cart.getCounts() + counts);
			cart.setProductPrice(productService.getProduct(productId).getPrice() * cart.getCounts());
			cartService.updateCart(cart);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		System.out.println("我返回了");
		return resultMap;
	}
	
	@RequestMapping(value = "/getCarts", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCarts(int userId) {
		List<Cart> cartList = cartService.getCarts(userId);
		Gson gson = new Gson();
		String carts = gson.toJson(cartList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", carts);
		return resultMap;
	}
	
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCart(int userId, int productId) {
		cartService.deleteCart(userId, productId);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		System.out.println("我返回了");
		return resultMap;
	}
}
