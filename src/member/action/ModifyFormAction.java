package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class ModifyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//Data 꺼내기
		HttpSession session = request.getSession();
		String id = "" + session.getAttribute("memId");
		System.out.println(id);
		
		//DB
		MemberDTO memberDTO = MemberDAO.getInstance().login(id);
		request.setAttribute("memberDTO", memberDTO);
		request.setAttribute("display", "/member/modifyForm.jsp");
		
		return "/main/index.jsp";
	}

}
