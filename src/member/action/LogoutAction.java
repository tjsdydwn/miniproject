package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//세션 꺼내오기
		HttpSession session = request.getSession();
		session.invalidate();

		request.setAttribute("display", "/template/body.jsp");

		return "/main/index.jsp";
	}
}
