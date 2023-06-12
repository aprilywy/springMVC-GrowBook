package april.demo.dao;

import java.util.List;

import april.demo.entity.UserDetail;

public interface UserDetailDao {

	UserDetail getUserDetail(int id);
	
	void addUserDetail(UserDetail userDetail);
	
	public boolean deleteUserDetail(int id);
	
	public boolean updateUserDetail(UserDetail userDetail);
	
	public List<UserDetail> getAllUserDetail();
}
