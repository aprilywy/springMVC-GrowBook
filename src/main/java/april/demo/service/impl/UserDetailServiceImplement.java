package april.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import april.demo.dao.UserDetailDao;
import april.demo.entity.UserDetail;
import april.demo.service.UserDetailService;

@Service
public class UserDetailServiceImplement implements UserDetailService {

	@Autowired
	private UserDetailDao userDetailDao; 
	
	@Override
	public UserDetail getUserDetail(int id) {
		
		return userDetailDao.getUserDetail(id);
	}

	@Override
	public void addUserDetail(UserDetail userDetail) {
		
		userDetailDao.addUserDetail(userDetail);
	}

	@Override
	public boolean deleteUserDetail(int id) {
		
		return userDetailDao.deleteUserDetail(id);
	}

	@Override
	public boolean updateUserDetail(UserDetail userDetail) {
		
		return userDetailDao.updateUserDetail(userDetail);
	}

	@Override
	public List<UserDetail> getAllUserDetail() {
		
		return userDetailDao.getAllUserDetail();
	}

}
