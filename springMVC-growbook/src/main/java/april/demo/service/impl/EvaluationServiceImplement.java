package april.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import april.demo.dao.EvaluationDao;
import april.demo.entity.Evaluation;
import april.demo.service.EvaluationService;

@Service
public class EvaluationServiceImplement implements EvaluationService {

	@Autowired
	private EvaluationDao evaluationDao;
	
	@Override
	public Evaluation getEvaluation(int userId, int productId, String time) {
		return evaluationDao.getEvaluation(userId, productId, time);
	}

	@Override
	public void addEvaluation(Evaluation evaluation) {
		evaluationDao.addEvaluation(evaluation);
	}

	@Override
	public boolean deleteEvaluation(int userId, int productId, String time) {
		return evaluationDao.deleteEvaluation(userId, productId, time);
	}

	@Override
	public boolean updateEvaluation(Evaluation evaluation) {
		return evaluationDao.updateEvaluation(evaluation);
	}

	@Override
	public List<Evaluation> getProductEvaluation(int productId) {
		return evaluationDao.getProductEvaluation(productId);
	}

}
