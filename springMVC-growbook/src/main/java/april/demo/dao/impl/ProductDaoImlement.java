package april.demo.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import april.demo.dao.ProductDao;
import april.demo.entity.Product;

@Repository
public class ProductDaoImlement implements ProductDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Product getProduct(int id) {
		String hql = "from product where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, id);
		return (Product) query.uniqueResult();
	}

	@Override
	public Product getProduct(String name) {
		String hql = "from product where name = :name";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, name);
		return (Product) query.uniqueResult();
	}

	@Override
	public void addProduct(Product product) {
		sessionFactory.getCurrentSession().save(product);
	}

	@Override
	public boolean deleteProduct(int id) {
		String hql = "delete Product where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean updateProduct(Product product) {
		String hql = "update Product set name = :name, auther = :auther, description = :description, keyWord = :keyWord, price = :price, counts= :counts, type = :type where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, product.getName());
		query.setParameter(1, product.getAuther());
		query.setParameter(2, product.getDescription());
		query.setParameter(3, product.getKeyWord());
		query.setParameter(4, product.getPrice());
		query.setParameter(5, product.getCounts());
		query.setParameter(6, product.getType());
		query.setParameter(7, product.getId());
		return query.executeUpdate() > 0;
	}

	@Override
	public List<Product> getProductsByType(int type) {
		String hql = "from Product where type = :type";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, type);
		return query.list();
	}

	@Override
	public List<Product> getAllProduct() {
		String hql = "from Product";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
