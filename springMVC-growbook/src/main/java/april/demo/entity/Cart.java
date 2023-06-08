package april.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import april.demo.dto.CartPriKey;

@Entity
@Table(name = "`cart`")
@IdClass(value = CartPriKey.class)
public class Cart {

	@Id
	@Column(name = "user_id")
	private Integer userId;
	
	@Column(name = "product_id")
	private Integer productId;
	
	@Column(name = "product_price")
	private Integer productPrice;
	
	@Column(name = "`counts`")
	private Integer counts;

	public Cart() {
		super();
	}

	public Cart(Integer userId, Integer productId, Integer productPrice, Integer counts) {
		super();
		this.userId = userId;
		this.productId = productId;
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
