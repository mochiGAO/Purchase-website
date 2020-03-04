package buildingDb;

import java.util.List;

public class BuildinginfoSrvc {
	public List<Buildings> searchBuildings(String buildingname){
		BuildinginfoDao bDao = new BuildinginfoDao();
		return bDao.getLatLng(buildingname);
	}

}
