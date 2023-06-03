package april.demo.dao;

import java.util.List;

import april.demo.entity.User;

public interface UserDao {

	User getUser(int id);
	
	User getUser(String nameOrEmail);
	
	void addUser(User user);
	
	public boolean deleteUser(int id);
	
	public boolean updateUser(User user);
	
	public List<User> getAllUser();
}
