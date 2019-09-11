package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		if (MemberDAO.getInstance().isExistId(id)) {
			return "/member/checkIdFail.jsp";
		} else {
			return "/member/checkIdOk.jsp";
		}
	}
}
