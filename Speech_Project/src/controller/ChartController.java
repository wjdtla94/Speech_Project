package controller;

import java.util.List;
import java.util.Map;

import dao.MyBatisDao;
import dto.Keyword;
import setting.Component;
import setting.Controller;
import singleton.MyBatisConnectionFactory;

@Component("/view/chart.do")
public class ChartController implements Controller{

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// TODO Auto-generated method stub
		List<Keyword> word_list = new MyBatisDao(MyBatisConnectionFactory.getSqlSessionFactory()).selectList();
		for(int i=0; i< word_list.size(); i++) {
			System.out.println(word_list.get(i).getNo());
			System.out.println(word_list.get(i).getSpeech_date());
			
		}
		model.put("word_list", word_list);
		return "include:/view/index.jsp";
	}

}
