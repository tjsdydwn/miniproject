package member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public class CheckPostAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		List<ZipcodeDTO> list = null;
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		if (sido != null && roadname != null) {
			list = MemberDAO.getInstance().getZipcodeList(sido, sigungu, roadname);
		}
		if (list != null) {
			request.setAttribute("list", list);
		}
		return "/member/checkPost.jsp";
	}
}
