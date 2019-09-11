package board.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int seq;
	private String id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private int pseq;
	private int reply;
	private int hit;
	private String logtime;

	public String getLogtime() {
		String result = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date parsedLogtime = (Date) sdf.parse(logtime);
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			result = sdf.format(parsedLogtime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
}
