package april.demo.dao;

import java.util.List;

import april.demo.entity.User;

public interface UserDao {

	User getUser(int id);
	
	User getUser(String nameOrEmail);
	
	void addUser(User user);
	
	boolean deleteUser(int id);
	
	boolean updateUser(User user);
	
	List<User> getAllUser();
}
