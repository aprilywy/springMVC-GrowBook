package april.demo.service;

import java.util.List;

import april.demo.dto.Response;
import april.demo.entity.User;

public interface UserService {

	User getUser(int id);
	
	User getUser(String nameOrEmail);
	
	void addUser(User user);
	
	Response deleteUser(int id);
	
	boolean updateUser(User user);
	
	List<User> getAllUser();
}
