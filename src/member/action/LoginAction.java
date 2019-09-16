package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		// DB
		MemberDTO memberDTO = MemberDAO.getInstance().login(id, pwd);

		// 응답
		if (memberDTO == null) {
			request.setAttribute("display", "/template/body.jsp");
			request.setAttribute("loginFail", true);
			return "/main/index.jsp";
		
		} else {
			// 세션
			HttpSession session = request.getSession();
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());

			request.setAttribute("display", "/template/body.jsp");

			return "/main/index.jsp";
		}
	}
}
