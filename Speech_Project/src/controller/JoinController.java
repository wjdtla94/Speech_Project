package controller;

import java.util.Map;

import dao.MyBatisDao;
import dto.User;
import setting.Component;
import setting.Controller;
import setting.DataBinding;
import singleton.MyBatisConnectionFactory;
@Component("/view/user.do")
public class JoinController implements Controller, DataBinding{
	
	@Override
	public Object[] getDataBinders() {
		// TODO Auto-generated method stub
		return new Object[] {"user", dto.User.class};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// TODO Auto-generated method stub
		
		User user = (User) model.get("user");
		int result = new MyBatisDao(MyBatisConnectionFactory.getSqlSessionFactory()).insert_user(user);
			if(result > -1) {
				model.put("Message"	, "회원 가입 성공!");
				return "/view/login.jsp";
			}else {
				model.put("Message"	, "회원 가입 실패!");
				return "/view/login.jsp";
			}
	}

}
