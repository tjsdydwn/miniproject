package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardReplyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();

		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId("" + session.getAttribute("memId"));
		boardDTO.setName("" + session.getAttribute("memName"));
		boardDTO.setEmail("" + session.getAttribute("memEmail"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		boardDTO.setPseq(Integer.parseInt(request.getParameter("pseq")));
		
		BoardDAO.getInstance().boardReply(boardDTO);
		
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardModify.jsp");

		return "/main/index.jsp";
	}

}
