package april.demo.service;

import java.util.List;

import april.demo.entity.Evaluation;

public interface EvaluationService {

	public Evaluation getEvaluation(int userId, int productId, String time);
	
	public void addEvaluation(Evaluation evaluation);
	
	public boolean deleteEvaluation(int userId, int productId, String time);
	
	public boolean updateEvaluation(Evaluation evaluation);
	
	public List<Evaluation> getProductEvaluation(int productId);
}
