package april.demo.dao;

import java.util.List;

import april.demo.entity.UserDetail;

public interface UserDetailDao {

	UserDetail getUserDetail(int id);
	
	void addUserDetail(UserDetail userDetail);
	
	boolean deleteUserDetail(int id);
	
	boolean updateUserDetail(UserDetail userDetail);
	
	List<UserDetail> getAllUserDetail();
}
