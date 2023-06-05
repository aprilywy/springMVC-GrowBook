package april.demo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import april.demo.dao.CartDao;
import april.demo.dao.EvaluationDao;
import april.demo.dao.OrderDao;
import april.demo.dao.ProductDao;
import april.demo.dto.Response;
import april.demo.entity.Product;
import april.demo.service.ProductService;

@Service
public class ProductServiceImplement implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private EvaluationDao evaluationDao;
	
	@Override
	public Product getProduct(int id) {
		return productDao.getProduct(id);
	}

	@Override
	public Product getProduct(String name) {
		return productDao.getProduct(name);
	}

	@Override
	public void addProduct(Product product) {
		productDao.addProduct(product);
	}

	@Override
	@Transactional
	public Response deleteProduct(int id) {
		try {
			evaluationDao.deleteEvaluationByProduct(id);
			cartDao.deleteCartByProduct(id);
			orderDao.deleteOrderByProductId(id);
			productDao.deleteProduct(id);
			return new Response(1, "刪除商品成功", null);
		} catch (Exception e) {
			return new Response(1, "刪除商品成功", null);
		}
	}

	@Override
	public boolean updateProduct(Product product) {
		return productDao.updateProduct(product);
	}

	@Override
	public List<Product> getProductsByType(int type) {
		return productDao.getProductsByType(type);
	}

	@Override
	public List<Product> getAllProduct() {
		return productDao.getAllProduct();
	}

}
