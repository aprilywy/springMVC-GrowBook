package april.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "users")
public class User {
	
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator",strategy = "increment")
	@Id
	@Column(name = "`id`")
	private Integer id;
	
	@Column(name = "`username`")
	private String username;
	
	@Column(name = "`email`")
	private String email;
	
	@Column(name = "nick_name")
	private String nickName;
	
	@Column(name = "`role`")
	private Integer role;
	
	public User() {
		super();
	}

	public User(Integer id, String username, String email, String nickName, Integer role) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.nickName = nickName;
		this.role = role;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", email=" + email + ", nickName=" + nickName + ", role="
				+ role + "]";
	}

}
