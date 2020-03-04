package database;
import java.util.List;

public class PlacesInfoSrvc {
	public List<String> search(String username){
		PlacesinfoDao pDao = new PlacesinfoDao();
		return pDao.search(username);
	}
	public boolean insert(String username, String places) {
		
		PlacesinfoDao pDao = new PlacesinfoDao();
		pDao.insertsearedbuilding(username,places);
		
		return true;
		
	}

}
