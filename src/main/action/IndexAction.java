package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class IndexAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("display", "/template/body.jsp");
		//클라이언트의 요청에 따라 body부분에 각각 다른 화면 출력.
		return "/main/index.jsp";
	}

}
