package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardModifyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setSeq(Integer.parseInt(request.getParameter("seq")));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		BoardDAO.getInstance().modify(boardDTO);
		
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardModify.jsp");
		
		return "/main/index.jsp";
	}

}
