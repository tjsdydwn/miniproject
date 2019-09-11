package member.bean;

import lombok.Data;

@Data
public class ZipcodeDTO {
	private String zipcode;
	private String sido;
	private String sigungu;
	private String yubmyundong;
	private String ri;
	private String roadname;
	private String buildingname;
	
	public String getZipcode() {
		return zipcode.length() < 5 ? "0"+zipcode : zipcode;
	}
	
	public String getAdress() {
		sigungu = sigungu == null ? "" : sigungu;
		yubmyundong = yubmyundong == null ? "" : yubmyundong;
		ri = ri == null ? "" : ri;
		roadname = roadname == null ? "" : roadname;
		buildingname = buildingname == null ? "" : buildingname;
		
		return sido + " " + sigungu + " " + yubmyundong + " " + ri + " " + roadname + " " + buildingname;
	}
}

