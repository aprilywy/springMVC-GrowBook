package april.demo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import april.demo.dao.UserDao;
import april.demo.entity.User;

@Repository
public class UserDaoImplement implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User getUser(int id) {
		String hql = "from User where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return (User) query.uniqueResult();
	}

	@Override
	public User getUser(String nameOrEmail) {
		String hql = "from User where email = :email";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("email", nameOrEmail);
		
		if (query.uniqueResult() == null) {
			hql = "from User where username = :username";
			query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter("username", nameOrEmail);
		}
		return (User) query.uniqueResult();
	}

	@Override
	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
		
	}

	@Override
	public boolean deleteUser(int id) {
		String hql = "delete User where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean updateUser(User user) {
		String hql = "update User set username = :username, email = :email, nickName = :nickName where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("username", user.getUsername());
		query.setParameter("email", user.getEmail());
		query.setParameter("nickName", user.getNickName());
		query.setParameter("id", user.getId());
		return query.executeUpdate() > 0;
	}

	@Override
	public List<User> getAllUser() {
		String hql = "from User";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	
}
