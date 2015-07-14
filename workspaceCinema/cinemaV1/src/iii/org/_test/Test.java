package iii.org._test;
import java.util.ArrayList;
import java.util.List;


public class Test {
	String seat = "";
	List<String> list = new ArrayList<>();
	
	
	void getSeat(){
		for (int seatX = 1; seatX <= 12; seatX++) {
			for (int seatY = 1; seatY <= 16; seatY++) {

				seat = "" + seatX + "-" + seatY;
				// if 前n排，空下左右各4個，共8個空位
				if (seatX <= 3 && seatY >= 16-8) {
					break;
				} else {
					list.add(seat);
				}
			} System.out.println(seat);
		}
	}
	
	public static void main(String[] args) {
		Test ts = new Test();
		ts.getSeat();

	}
}
