package april.demo.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import april.demo.dao.UserDetailDao;
import april.demo.entity.UserDetail;

@Repository
public class UserDetailDaoImplement implements UserDetailDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public UserDetail getUserDetail(int id) {
		String hql = "from UserDetail where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return (UserDetail) query.uniqueResult();
	}

	@Override
	public void addUserDetail(UserDetail userDetail) {
		sessionFactory.getCurrentSession().save(userDetail);
		
	}

	@Override
	public boolean deleteUserDetail(int id) {
		String hql = "delete UserDetail where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean updateUserDetail(UserDetail userDetail) {
		String hql = "update UserDetail set password = :password, phoneNumber = :phoneNumber, gender = :gender, birthday = :birthday, postNumber = :postNumber, address = :address where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("password", userDetail.getPassword());
		query.setParameter("phoneNumber", userDetail.getPhoneNumber());
		query.setParameter("gender", userDetail.getGender());
		query.setParameter("birthday", userDetail.getBirthday());
		query.setParameter("postNumber", userDetail.getPostNumber());
		query.setParameter("address", userDetail.getAddress());
		query.setParameter("id", userDetail.getId());
		return query.executeUpdate() > 0;
	}

	@Override
	public List<UserDetail> getAllUserDetail() {
		String hql = "from UserDetail";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
