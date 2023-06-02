package april.demo.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import april.demo.dao.UserDetailDao;
import april.demo.entity.UserDetail;

@Repository
public class UserDetailDaoImplement implements UserDetailDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public UserDetail getUserDetail(Integer id) {
		String hql = "from UserDetail where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, id);
		return (UserDetail) query.uniqueResult();
	}

	@Override
	public void addUserDetail(UserDetail userDetail) {
		sessionFactory.getCurrentSession().save(userDetail);
		
	}

	@Override
	public boolean deleteUserDetail(Integer id) {
		String hql = "delete UserDetail where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean updateUserDetail(UserDetail userDetail) {
		String hql = "update UserDetail set password = :password, phoneNumber = :phoneNumber, gender = :gender, birthday = :birthday, postNumber = :postNumber, address = :address where id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, userDetail.getPassword());
		query.setParameter(1, userDetail.getPhoneNumber());
		query.setParameter(2, userDetail.getGender());
		query.setParameter(3, userDetail.getBirthday());
		query.setParameter(4, userDetail.getPostNumber());
		query.setParameter(5, userDetail.getAddress());
		query.setParameter(6, userDetail.getId());
		return query.executeUpdate() > 0;
	}

	@Override
	public List<UserDetail> getAllUserDetail() {
		String hql = "from UserDetail";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
