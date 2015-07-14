package iii.org.statist.controller;

import iii.org.init.JsonUtils;
import iii.org.movie.model.MovieService;
import iii.org.statist.model.BoxOfficeByMoviePerDay;
import iii.org.statist.model.BoxOfficeService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetTotalByDate
 */
@WebServlet("/admin/statist/getBoxOfficeByMoive.do")
public class BoxOfficeMoviePerDay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoxOfficeMoviePerDay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		BoxOfficeService boService = new BoxOfficeService();	
		MovieService ms = new MovieService();	
		
		// set format style
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");	
		// 取得現在時間
		Calendar calendar = Calendar.getInstance();
		
		// 從1周前取到前一天，先取前一天
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		String toDate =  sdf.format(calendar.getTime());
		
		// 取1周前
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 6);
		calendar.set(Calendar.HOUR_OF_DAY, 1);
		calendar.set(Calendar.MINUTE, 0);
		String fromDate = sdf.format(calendar.getTime());
		
		// 查詢時間
		List<Integer> movies = boService.getMovieInPeroid(fromDate, toDate);	

		String[] timeList = new String[14]; 
		
		// 設定一周內每天的開始時間與結束時間
		for(int i=0,max = timeList.length; i< max; i+=2 ){
			// 設定開始時間為 01:00
			calendar.set(Calendar.AM_PM, 0);
			calendar.set(Calendar.HOUR_OF_DAY, 1);
			calendar.set(Calendar.MINUTE, 0);
			timeList[i] = sdf.format(calendar.getTime());				
			// 設定結束時間為 23:59
			calendar.set(Calendar.AM_PM, 1);
			calendar.set(Calendar.HOUR_OF_DAY, 23);
			calendar.set(Calendar.MINUTE, 59);	
			timeList[i+1] = sdf.format(calendar.getTime());
			// 日期+1
			calendar.set(Calendar.DATE, calendar.get(Calendar.DATE)+1);				
		}

		
		
		HashMap<String, List<BoxOfficeByMoviePerDay>> weekList = new HashMap<String,List<BoxOfficeByMoviePerDay>>();	
		for(Integer movieId: movies){	
			List<BoxOfficeByMoviePerDay> list = new ArrayList<>(); 
			for(int i=0,max =timeList.length; i< max; i+=2 ){	
				// 取得統計資料並使用BoxOfficeByMoviePerDay接住，存入list
				BoxOfficeByMoviePerDay total = new BoxOfficeByMoviePerDay();
				total.setBoxOffice(boService.getBoxOfficeByMovieWithDate(movieId, timeList[i], timeList[i+1]));
				total.setShowDate(Date.valueOf(timeList[i].substring(0,10)));
				list.add(total);
			}	
			weekList.put(ms.queryByID(movieId).getName(),list);
		}

		PrintWriter out = response.getWriter(); 	
		out.print(JsonUtils.obj2Json(weekList));
		out.flush();
		out.close();
	}


}
