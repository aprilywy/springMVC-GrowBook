package april.demo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import april.demo.dao.CartDao;
import april.demo.dao.EvaluationDao;
import april.demo.dao.OrderDao;
import april.demo.dao.UserDao;
import april.demo.dao.UserDetailDao;
import april.demo.dto.Response;
import april.demo.entity.User;
import april.demo.service.UserService;

@Service
public class UserServiceImplement implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserDetailDao userDetailDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private EvaluationDao evaluationDao;
	
	@Override
	public User getUser(int id) {
		return userDao.getUser(id);
	}

	@Override
	public User getUser(String usernameOrEmail) {
		return userDao.getUser(usernameOrEmail);
	}

	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	@Transactional
	public Response deleteUser(int id) {
		try {
			evaluationDao.deleteEvaluationByUser(id);
			cartDao.deleteCartByUser(id);
			orderDao.deleteOrderByUser(id);
			userDetailDao.deleteUserDetail(id);
			userDao.deleteUser(id);
			return new Response(1, "刪除成功", null);
		} catch (Exception e) {
			return new Response(0, "刪除失敗，此用戶存有購買記錄、評價紀錄或購物車紀錄", null);
		}
	}

	@Override
	public boolean updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

}
