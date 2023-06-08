package april.demo.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import april.demo.dao.EvaluationDao;
import april.demo.entity.Evaluation;

@Repository
public class EvaluationDaoImplement implements EvaluationDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Evaluation getEvaluation(int userId, int productId, String time) {
		String hql = "from Evaluation where userId = :userId and productId = :productId and time = :time";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		query.setParameter("time", time);
		return (Evaluation) query.uniqueResult();
	}

	@Override
	public void addEvaluation(Evaluation evaluation) {
		sessionFactory.getCurrentSession().save(evaluation);
	}

	@Override
	public boolean deleteEvaluation(int userId, int productId, String time) {
		String hql = "delete Evaluation where userId = :userId and productId = :productId and time = :time";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		query.setParameter("time", time);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean updateEvaluation(Evaluation evaluation) {
		String hql = "update Evaluation set content = :content where userId = :userId and productId = :productId and time = :time";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("content", evaluation.getContent());
		query.setParameter("userId", evaluation.getUserId());
		query.setParameter("productId", evaluation.getProductId());
		query.setParameter("time", evaluation.getTime());
		return query.executeUpdate() > 0;
	}

	@Override
	public List<Evaluation> getProductEvaluation(int productId) {
		String hql = "from Evaluation where productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("productId", productId);
		return query.list();
	}

	@Override
	public boolean deleteEvaluationByUser(int userId) {
		String hql = "delete Evaluation where userId = :userId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		return query.executeUpdate() > 0;
	}

	@Override
	public boolean deleteEvaluationByProduct(int productId) {
		String hql = "delete Evaluation where productId = :productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("productId", productId);
		return query.executeUpdate() > 0;
	}

}
