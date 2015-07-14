package iii.org._test;
import com.google.gson.Gson;


public class Jasontest {
	static String json = "[{\"screenName\": \"ScreenA\",\"firstshow\": \"08:40\",\"ticketType\": \"21\",\"showList\":[ {\"name\": \"飛天鋼鐵人24\",\"image\": \"/cinema_V1\\\\moviepicture\\\\10019.jpg\",\"length\": 231,\"date\": \"2015-06-25\",\"restTime\": 29,\"start\": \"2015-06-25T00:40:00.000Z\",\"end\": \"2015-06-25T05:00:00.000Z\"	},{\"name\": \"飛天鋼鐵人24\",\"image\": \"/cinema_V1\\\\moviepicture\\\\10019.jpg\",\"length\": 231,\"date\": \"2015-06-25\",\"restTime\": 29,\"start\": \"2015-06-25T05:00:00.000Z\",\"end\": \"2015-06-25T09:20:00.000Z\"	},	{\"name\": \"飛天鋼鐵人24\",\"image\": \"/cinema_V1\\\\moviepicture\\\\10019.jpg\",\"length\": 231,\"date\": \"2015-06-25\",\"restTime\": 29,\"start\": \"2015-06-25T09:20:00.000Z\",\"end\": \"2015-06-25T13:40:00.000Z\"}]}]";
	//static String  json =  "[{\"key\":\"exam\",\"url\":\"http://leveluplunch.com/java/examples\"},{\"key\":\"exercises\",\"url\":\"http://leveluplunch.com/java/exercises\"}]";
	public static void main(String[] args) {
		Gson gson = new Gson();
		Screen[] screenArray = gson.fromJson(json, Screen[].class);
	    for(Screen screen:screenArray){
	    	System.out.println(screen.screenName);
	    	System.out.println(screen.firstshow);
	    	for (Show show :screen.showList)
	    	{
	    		System.out.println(show.name + "," +  show.start + "," + show.end);
	    		System.out.println(show.length + "," +  show.image);
	    	}
	    		
	    	System.out.println("---------------------------------------");	
	    }
	}

	class NavItem{
		public String key;
		public String url;
	}
	
	class Screen {
		public String firstshow;
		public String screenName;
		public Show showList[];
		public String ticketType;
	}

	class Show {
		public String date;
		public String start;
		public String end;
		public String image;
		public String length;
		public String name;
		public String restTime;
	}

}
