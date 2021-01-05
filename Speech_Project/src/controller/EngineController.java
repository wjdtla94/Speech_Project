package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import dao.MyBatisDao;
import dto.Engine;
import dto.User;
import setting.Component;
import setting.Controller;
import setting.DataBinding;
import singleton.MyBatisConnectionFactory;
@Component("/view/engine.do")
public class EngineController implements Controller,DataBinding{

	@Override
	public Object[] getDataBinders() {
		// TODO Auto-generated method stub
		return new Object[] {"engine",dto.Engine.class};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = (HttpSession) model.get("session");
		User user = (User) session.getAttribute("loginuser");
		Engine engine = (Engine)model.get("engine");
		engine.setEmail(user.getEmail());
		new MyBatisDao(MyBatisConnectionFactory.getSqlSessionFactory()).insert_engine(engine);
		return "/view/index.jsp"; 
	}

}
