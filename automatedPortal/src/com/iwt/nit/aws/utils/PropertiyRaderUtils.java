package com.iwt.nit.aws.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

public class PropertiyRaderUtils {


	private static Properties configProp = new Properties();

	public static String getPropertiesValue(String keyName) {
		try {
			InputStream is = PropertiyRaderUtils.class.getClassLoader()
					.getResourceAsStream("webportal.properties");
			configProp.load(is);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String value = configProp.getProperty(keyName);
		return value;
	}

	public static boolean status(List<String> list,String msg){
		
		for(String s:list){
	        if(!s.equals(msg))
	        	return false;
	    }
		return true;
	}
	public static void main(String[] args) {
		String APP_NAME[]=getPropertiesValue("APP_NAME").split(",");
		//System.out.println(APP_NAME);
		
		String input="ABC2345";
		ArrayList<String> foos = new ArrayList<>();
		foos.add("foo");
		foos.add("foo9");
		String str = "ABC20345";
		boolean status=false;
		for (String string : APP_NAME) {
		    if(string.equalsIgnoreCase(str)){
		    	status=true;
		            break;
		    }else{
		    	status=false;
		    }
		}
		
		System.out.println(status);
			
	}
	
}
