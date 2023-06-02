package april.demo.dao;

import java.util.List;

import april.demo.entity.User;

public interface UserDao {

	User getUser(Integer id);
	
	User getUser(String nameOrEmail);
	
	void addUser(User user);
	
	public boolean deleteUser(Integer id);
	
	public boolean updateUser(User user);
	
	public List<User> getAllUser();
}
