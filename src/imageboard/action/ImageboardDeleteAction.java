package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String[] checkedSeq = request.getParameterValues("checkedSeq");
//		List<String> list = Arrays.asList(checkedSeq);
		
//		int[] seqList = new int[checkedSeq.length];
//		for(int i = 0; i < seqList.length; i++) {
//			seqList[i] = Integer.parseInt(checkedSeq[i]);
//		}
//		String str = "";
//		for(String seq : checkedSeq) {
//			str += seq + ",";
//		}
//		String query = str.substring(0, str.length() - 1);
//		System.out.println(query);
		
		ImageboardDAO.getInstance().delete(checkedSeq);
		
		request.setAttribute("display", "/template/body.jsp");
		return "/main/index.jsp";
	}
	
}
