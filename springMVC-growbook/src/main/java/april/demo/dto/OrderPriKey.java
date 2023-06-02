package april.demo.dto;

import java.io.Serializable;

public class OrderPriKey implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer userId;
	
	private Integer productId;
	
	private String time;

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

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof OrderPriKey)) {
			return false;
		}
		OrderPriKey that = (OrderPriKey) obj;
		if (getUserId() != that.getUserId()) {
			return false;
		}
		if (getProductId() != that.getProductId()) {
			return false;
		}
		return getTime().equals(that.getTime());
	}
	
	@Override
	public int hashCode() {
		int result= getUserId();
		result = 31 * result + getProductId();
		result = 31 * result + getTime().hashCode();
		
		return result;
	}
	
}
