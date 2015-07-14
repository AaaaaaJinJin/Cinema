package iii.org.init;

import java.text.SimpleDateFormat;
import java.util.Date;

public enum DateFormat {
	
	DATE_TIME_TEXT("yyyy/MM/dd HH:mm:ss"),
	DATE_TIME_VALUE("yyyyMMdd HHmmss"),
	DATE_TEXT("yyyy/MM/dd"),
	DATE_VALUE("yyyyMMdd"),
	;
	
	public String value;
	
	DateFormat(String format) {
		this.value = format;
	}
	
	public String now() {
		return format(new Date());
	}
	
	public String format(long date) {
		return format(new Date(date));
	}

	public String format(Date date) {
		return new SimpleDateFormat(value).format(date);
	}
}