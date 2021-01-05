package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import setting.ApplicationContext;
import setting.ContextLoaderListener;
import setting.Controller;
import setting.DataBinding;
import setting.ServletRequestDataBinder;


/**
 * Servlet implementation class DispacherServlet
 */
@SuppressWarnings("serial")
@WebServlet("*.do")
public class DispacherServlet extends HttpServlet {   //frontController

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String servletPath = req.getServletPath();
		try {
			ApplicationContext ctx = ContextLoaderListener.getApplicationContext();
			HashMap<String, Object> model = new HashMap<String,Object>();
			model.put("session", req.getSession());
			Controller controller = (Controller) ctx.getBean(servletPath);
			
			   if (controller == null) {
			        throw new Exception("요청한 서비스를 찾을 수 없습니다.");
			      }
			      
			      if (controller instanceof DataBinding) {
			        prepareRequestData(req, model, (DataBinding)controller);
			      }
			      
			String viewUrl = controller.execute(model);
			
			for(String key : model.keySet()) {
				req.setAttribute(key, model.get(key));
			}
			if(viewUrl.startsWith("redirect:")) {
				resp.sendRedirect(viewUrl.substring(9));
				return;
			}else if(viewUrl.startsWith("include:")){
				RequestDispatcher rd = req.getRequestDispatcher(viewUrl.substring(8));
				rd.include(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher(viewUrl);
				rd.forward(req, resp);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
	  private void prepareRequestData(HttpServletRequest req, HashMap<String, Object> model, DataBinding dataBinding) throws Exception {
		    Object[] dataBinders = dataBinding.getDataBinders();
		    String dataName = null;
		    Class<?> dataType = null;
		    Object dataObj = null;
		    for (int i = 0; i < dataBinders.length; i+=2) {
		      dataName = (String)dataBinders[i];
		      dataType = (Class<?>) dataBinders[i+1];
		      dataObj = ServletRequestDataBinder.bind(req, dataType, dataName);
		      model.put(dataName, dataObj);
		    }
		  }

}
