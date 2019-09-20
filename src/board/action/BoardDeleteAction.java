package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteAction implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoardDAO.getInstance().delete(seq);
		
		request.setAttribute("pg", 1);
		request.setAttribute("display", "/board/boardModify.jsp");
		
		return "/main/index.jsp";
	}
}
