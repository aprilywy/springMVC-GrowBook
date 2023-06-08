package april.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import april.demo.dto.OrderPriKey;

@Entity
@Table(name = "evaluation")
@IdClass(value = OrderPriKey.class)
public class Evaluation {

	@Id
	@Column(name = "user_id")
	private Integer userId;
	
	@Column(name = "product_id")
	private Integer productId;
	
	@Column(name = "`time`")
	private String time;
	
	@Column(name = "`content`")
	private String content;

	public Evaluation() {
		super();
	}

	public Evaluation(Integer userId, Integer productId, String time, String content) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.time = time;
		this.content = content;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
