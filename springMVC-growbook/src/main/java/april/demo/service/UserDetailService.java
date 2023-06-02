package april.demo.service;

import java.util.List;

import april.demo.entity.UserDetail;

public interface UserDetailService {

	public UserDetail getUserDetail(Integer id);
	
	public void addUserDetail(UserDetail userDetail);
	
	public boolean deleteUserDetail(Integer id);
	
	public boolean updateUserDetail(UserDetail userDetail);
	
	public List<UserDetail> getAllUserDetail();
}
