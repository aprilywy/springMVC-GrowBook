package april.demo.dao;

import java.util.List;

import april.demo.entity.Evaluation;

public interface EvaluationDao {

	Evaluation getEvaluation(int userId, int productId, String time);
	
	void addEvaluation(Evaluation evaluation);
	
	boolean deleteEvaluation(int userId, int productId, String time);
	
	boolean updateEvaluation(Evaluation evaluation);
	
	List<Evaluation> getProductEvaluation(int productId);
	
	boolean deleteEvaluationByUser(int userId);
	
	boolean deleteEvaluationByProduct(int productId);
}
