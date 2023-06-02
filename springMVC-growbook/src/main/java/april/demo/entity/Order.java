package april.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import april.demo.dto.OrderPriKey;

@Entity
@Table(name = "orders")
@IdClass(value = OrderPriKey.class)
public class Order {

	@Id
	@Column(name = "user_id")
	private Integer userId;
	
	@Column(name = "product_id")
	private Integer productId;
	
	@Column(name = "time")
	private String time;
	
	@Column(name = "order_status")
	private Integer orderStatus;
	
	@Column(name = "product_price")
	private Integer productPrice;
	
	@Column(name = "counts")
	private Integer counts;

	public Order() {
		super();
	}

	public Order(Integer userId, Integer productId, String time, Integer orderStatus, Integer productPrice,
			Integer counts) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.time = time;
		this.orderStatus = orderStatus;
		this.productPrice = productPrice;
		this.counts = counts;
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

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	
}
