package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardModifyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setSeq(Integer.parseInt(request.getParameter("seq")));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		BoardDAO.getInstance().modify(boardDTO);
		
		
		return new BoardListAction().requestPro(request, response);
	}

}
