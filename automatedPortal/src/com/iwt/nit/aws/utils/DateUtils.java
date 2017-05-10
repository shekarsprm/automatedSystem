package com.iwt.nit.aws.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static String YYYYMMDDHHMMSS="yyyy-MM-dd HH:mm:ss";
	public static String getCurrentDateTimestamp(){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSSSSS");//yyyy-MM-dd HH:mm:ss.SSSSSS  //yyyyMMddHHmmss
		Date now = new Date();
		//Date rounded = new Date(Math.round((now.getTime() / (1000.0 * 60 * 5))) * (1000 * 60 * 5));
		String timestamp = sdf.format(now);
		return timestamp;

	}
//YYYYMMDDhhmmss
	public static Timestamp processTimestamp(){

		Date updateDate =new Date();
		Timestamp timestampInf=null;
		try{
			SimpleDateFormat sdf=new SimpleDateFormat(YYYYMMDDHHMMSS);
			long updateTime = updateDate.getTime();
			timestampInf= new Timestamp(updateTime);
			}catch(Exception e){
				e.printStackTrace();
			}
	      return timestampInf;	
		}


	public static String processTimestampYYYYMMDD(){

		Date updateDate =new Date();
		Timestamp timestampInf=null;
		String todayDate="";
		try{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			todayDate=sdf.format(new Date());

		}catch(Exception e){
				e.printStackTrace();
			}
	      return todayDate;	
		}
	public static void main(String[] args) {

		System.out.println(processTimestampYYYYMMDD().toString());
	}
	/*public static void main(String[] args) {
	    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	    df.setLenient(false);

	    System.out.println(tryParse(df, "20160824162217"));
	    System.out.println(tryParse(df, "20160824162217"));
	    System.out.println(tryParse(df, "20160228231100"));

	    System.out.println(tryParse(df, "21000229231100")); // 29th Feb on non-leap year 2100
	    System.out.println(tryParse(df, "20160631231110")); // 31st Jun invalid day
	    System.out.println(tryParse(df, "20160229231160")); // Second > 59
	    System.out.println(tryParse(df, "20150229231100")); // 29th Feb on non-leap year 2015
	    System.out.println(tryParse(df, "20150228241100")); // Hour > 23

	}
*/
	private static Boolean tryParse(DateFormat df, String s) {
	    Boolean valid=true;
	    try {
	        Date threeHoursBefore = new Date();
	        threeHoursBefore.setTime(System.currentTimeMillis() - (3*60*60*1000));

	        Date threeHoursAfter = new Date();
	        threeHoursAfter.setTime(System.currentTimeMillis() + (3*60*60*1000));

	        Date dateToParse= df.parse(s);

	        valid=dateToParse.compareTo(threeHoursBefore) > 0 && dateToParse.compareTo(threeHoursAfter) < 0;
	        
	        System.out.println("Valid date is :::>>>"+valid);
	    } catch (ParseException e) {
	    	//e.printStackTrace();
	         valid=false;
	    }
	    return valid;
	}	
	
	/*public static void main(String[] args) {
	//	System.out.println(getCurrentDateTimestamp());//2016-04-05 14:41:12.000310 2016-04-05 14:41:33.000353
		
		Date date;
		String currentDate="10160824162217";
	    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");

	    try {
	        date = df.parse(currentDate);
	    } catch (ParseException e) {
	        throw new RuntimeException("Failed to parse date: ", e);
	    }
	    System.out.println(date);

	}
*/	
	
}
