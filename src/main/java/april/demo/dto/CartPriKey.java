package april.demo.dto;

import java.io.Serializable;

public class CartPriKey implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer userId;
	
	private Integer productId;

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

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		
		if (!(obj instanceof CartPriKey)) {
			return false;
		}
		
		CartPriKey that = (CartPriKey) obj;
		
		if (userId != that.userId) {
			return false;
		}
		
		return productId == that.productId;
	}
	
	@Override
	public int hashCode() {
		int result = userId;
		result = 31 * result + productId;
		return result;
	}
	
}
