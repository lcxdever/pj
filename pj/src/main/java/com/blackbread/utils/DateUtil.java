package com.blackbread.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String formart(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}
}
