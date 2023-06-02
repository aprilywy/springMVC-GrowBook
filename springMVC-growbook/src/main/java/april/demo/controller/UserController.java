package april.demo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import april.demo.dto.Response;
import april.demo.entity.User;
import april.demo.entity.UserDetail;
import april.demo.service.UserDetailService;
import april.demo.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserDetailService userDetailService;

	@RequestMapping(value = "/register")
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/amend_info")
	public String amend_info() {
		return "amend_info";
	}

	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/index")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/control")
	public String control() {
		return "control";
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doLogin(String userNameOrEmail, String password, HttpSession httpSession) {
		System.out.println("我接收到了登入請求" + userNameOrEmail + " " + password);
		String result = "fail";
		
		User user = userService.getUser(userNameOrEmail);
		if (user == null) {
			result = "unexist";
		} else {
			UserDetail userDetail = userDetailService.getUserDetail(user.getId());
			if (userDetail.getPassword().equals(password)) {
				result = "success";
				httpSession.setAttribute("currentUser", user);
			} else {
				result = "wrong";
			}
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}

	@RequestMapping(value = "/doRegister", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doRegister(String username, String email, String nickName, String password,
			String phoneNumber, Integer gender, String birthday, String postNumber, String address) {

		String result = "fail";
		
		User user = userService.getUser(username);
		if (user != null) {
			result = "nameExist";
		} else {
			user = userService.getUser(email);
			
			if (user != null) {
				result = "emailExist";
			} else {
				User user1 = new User();
				user1.setUsername(username);
				System.out.println(username);
				user1.setEmail(email);
				System.out.println(email);
				user1.setNickName(nickName);
				System.out.println(nickName);
				user1.setRole(0);
				userService.addUser(user1);
				user1 = userService.getUser(username);
				
				UserDetail userDetail = new UserDetail();
				userDetail.setId(user1.getId());
				userDetail.setAddress(address);
				userDetail.setBirthday(birthday);
				userDetail.setPassword(password);
				userDetail.setPhoneNumber(phoneNumber);
				userDetail.setGender(gender);
				userDetail.setPostNumber(postNumber);
				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				userDetail.setRegisterTime(sf.format(date));
				userDetailService.addUserDetail(userDetail);
				
				result = "success";
			}
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}

	@RequestMapping(value = "/doUpdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doUpdate(String username, String email, String nickName, String password,
			String phoneNumber, Integer gender, String birthday, String postNumber, String address) {
		String result = "fail";
		
		User user = userService.getUser(username);
		user.setEmail(email);
		user.setNickName(nickName);
		userService.updateUser(user);
		
		UserDetail userDetail = userDetailService.getUserDetail(user.getId());
		userDetail.setAddress(address);
		userDetail.setBirthday(birthday);
		userDetail.setPassword(password);
		userDetail.setPhoneNumber(phoneNumber);
		userDetail.setGender(gender);
		userDetail.setPostNumber(postNumber);
		userDetailService.updateUserDetail(userDetail);
		
		result = "success";
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}

	@RequestMapping(value = "/getAllUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllUser() {
		System.out.println("我接收到了獲取用戶請求");
		List<User> userList = new ArrayList<>();
		userList = userService.getAllUser();
		Gson gson = new Gson();
		String allUsers = gson.toJson(userList);
		System.out.println("返回結果是" + allUsers);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("allUsers", allUsers);
		return resultMap;
	}

	@RequestMapping(value = "/getUserById", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUserById(Integer id) {
		User user = userService.getUser(id);
		Gson gson = new Gson();
		String result = gson.toJson(user);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}

	@RequestMapping(value = "/getUserDetailById", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUserDetailById(Integer id) {
		UserDetail userDetail = userDetailService.getUserDetail(id);
		Gson gson = new Gson();
		String result = gson.toJson(userDetail);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}

	@RequestMapping(value = "getUserAddressAndPhoneNumber", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUserAddressAndPhoneNumber(Integer id) {
		String address = userDetailService.getUserDetail(id).getAddress();
		String phoneNumber = userDetailService.getUserDetail(id).getPhoneNumber();

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("address", address);
		resultMap.put("phoneNumber", phoneNumber);
		return resultMap;
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public Response deleteUser(Integer id) {
		return userService.deleteUser(id);
	}

	@RequestMapping(value = "/doLogout")
	public String doLogout(HttpSession httpSession) {
		httpSession.setAttribute("currentUser", " ");
		return "redirect:login";
	}

}
