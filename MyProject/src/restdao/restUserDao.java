package restdao;
 
import java.util.List;

import entity.restUser;
 
public interface restUserDao {
	public boolean score(restUser user) ;//input user rating infmation
	public List<restUser> getUserAll();//display all users operation records
}
