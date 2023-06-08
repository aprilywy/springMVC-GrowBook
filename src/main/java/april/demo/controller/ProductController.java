package april.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import april.demo.dto.Response;
import april.demo.entity.Product;
import april.demo.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/getAllProducts")
	@ResponseBody
	public Map<String, Object> getAllProducts() {
		List<Product> productList = new ArrayList<>();
		productList = productService.getAllProduct();
		Gson gson = new Gson();
		String allProducts = gson.toJson(productList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("allProducts", allProducts);
		return resultMap;
	}
	
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	@ResponseBody
	public Response deleteProduct(Integer id) {
		return productService.deleteProduct(id);
	}
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addProduct(String name, String auther, String description, String keyWord, int price, int counts, int type) {
		System.out.println("添加了商品：" + name);
		String result = "fail";
		Product product = new Product();
		product.setName(name);
		product.setAuther(auther);
		product.setDescription(description);
		product.setKeyWord(keyWord);
		product.setPrice(price);
		product.setCounts(counts);
		product.setType(type);
		productService.addProduct(product);
		result = "success";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/productDetail", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> productDetail(int id, HttpSession httpSession) {
		System.out.println("I am here!" + id);
		
		Product product = productService.getProduct(id);
		httpSession.setAttribute("productDetail", product);
		System.out.println("I am here" + product.getName());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		return resultMap;
	}
	
	@RequestMapping(value = "/product")
	public String product() {
		return "product";
	}
	
	@RequestMapping(value = "/getProductById", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getProductById(int id) {
		Product product = productService.getProduct(id);
		Gson gson = new Gson();
		String result = gson.toJson(product);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadFile(@RequestParam MultipartFile productImgUpload, String name, HttpServletRequest request) {
		String result = "fail";
		try {
			if (productImgUpload != null && !productImgUpload.isEmpty()) {
				String fileRealPath = request.getSession().getServletContext().getRealPath("/static/img");
				int id = productService.getProduct(name).getId();
				String fileName = String.valueOf(id) + ",jpg";
				File fileFolder = new File(fileRealPath);
				System.out.println("fileRealPath = " + fileRealPath + "/" + fileName);
				if (!fileFolder.exists()) {
					fileFolder.mkdirs();
				}
				File file = new File(fileFolder, fileName);
				productImgUpload.transferTo(file);
				result = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}
}
