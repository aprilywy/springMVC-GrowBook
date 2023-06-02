package april.demo.dto;

public class Response {

	private Integer status;
	
	private String message;
	
	private Object content;

	public Response() {
		super();
	}

	public Response(Integer status, String message, Object content) {
		super();
		this.status = status;
		this.message = message;
		this.content = content;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getContent() {
		return content;
	}

	public void setContent(Object content) {
		this.content = content;
	}
	
}
