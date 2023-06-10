package april.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "products")
public class Product {

	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator",strategy = "increment")
	@Id
	@Column(name = "`id`")
	private Integer id;
	
	@Column(name = "`name`")
	private String name;
	
	@Column(name = "author")
	private String author;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "key_word")
	private String keyWord;
	
	@Column(name = "`price`")
	private Integer price;
	
	@Column(name = "`counts`")
	private Integer counts;
	
	@Column(name = "`type`")
	private Integer type;

	public Product() {
		super();
	}

	public Product(Integer id, String name, String author, String description, String keyWord, Integer price,
			Integer counts, Integer type) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.description = description;
		this.keyWord = keyWord;
		this.price = price;
		this.counts = counts;
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
}
