package user.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {
	private String userId;
	private String name;
	private String pwd;
	private String email;
	private String tel;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Date logtime;
	
	
	@Override
	public String toString() {
		return userId + "\t" + name + "\t" + pwd
			+ "\t" + email + "\t" + tel + "\t" + zipcode
			+ "\t" + addr1 + "\t" + addr2 + "\t" + logtime;
	}
}
