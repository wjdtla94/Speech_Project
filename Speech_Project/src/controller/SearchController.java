package controller;

import java.util.List;
import java.util.Map;

import dao.MyBatisDao;
import dto.Keyword;
import setting.Component;
import setting.Controller;
import singleton.MyBatisConnectionFactory;
@Component("/view/search.do")
public class SearchController implements Controller{

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// TODO Auto-generated method stub
		List<Keyword> list = new MyBatisDao(MyBatisConnectionFactory.getSqlSessionFactory()).selectList();
		model.put("list", list);
		return "include:/view/index.jsp";
	}

}
 