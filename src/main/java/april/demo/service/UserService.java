package april.demo.service;

import java.util.List;

import april.demo.dto.Response;
import april.demo.entity.User;

public interface UserService {

	public User getUser(int id);
	
	public User getUser(String usernameOrEmail);
	
	public void addUser(User user);
	
	public Response deleteUser(int id);
	
	public boolean updateUser(User user);
	
	public List<User> getAllUser();
}
