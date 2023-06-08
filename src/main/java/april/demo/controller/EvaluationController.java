package april.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import april.demo.entity.Evaluation;
import april.demo.service.EvaluationService;
import april.demo.service.OrderService;

@Controller
public class EvaluationController {

	@Autowired
	private EvaluationService evaluationService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/addShoppingEvaluation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addShoppingEvaluation(int userId, int productId, String tontent) {
		System.out.println("我添加了" + userId + " " + productId);
		String result = null;
		if (orderService.getUserProductRecord(userId, productId)) {
			Evaluation evaluation = new Evaluation();
			evaluation.setUserId(userId);
			evaluation.setProductId(productId);
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
			evaluation.setTime(sf.format(date));
			evaluation.setContent(tontent);
			evaluationService.addEvaluation(evaluation);
			result = "success";
		} else {
			result = "noneRecord";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/getShoppingEvaluation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getShoppingEvaluations(int productId) {
		List<Evaluation> evaluationList = evaluationService.getProductEvaluation(productId);
		Gson gson = new Gson();
		String evaluations = gson.toJson(evaluationList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", evaluations);
		return resultMap;
	}
}