package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import dao.MyBatisDao;
import dto.User;
import setting.Component;
import setting.Controller;
import setting.DataBinding;
import singleton.MyBatisConnectionFactory;

@Component("/view/login.do")
public class LoginController implements Controller, DataBinding{

	@Override
	public Object[] getDataBinders() {
		// TODO Auto-generated method stub
		return new Object[] {"loginuser",dto.User.class};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// TODO Auto-generated method stub
		
			User loginuser = (User)model.get("loginuser");
			User user = new MyBatisDao(MyBatisConnectionFactory.getSqlSessionFactory()).login(loginuser);
			if(user != null) {
				HttpSession session = (HttpSession) model.get("session");
				session.setAttribute("loginuser", user);
				return "redirect:../view/index.jsp"; //상대경로 ..상위폴더로 이동
			}else {
				model.put("Message"	, "아이디 비밀번호가 다릅니다");
				return "/view/login.jsp";
			}
	}

}
