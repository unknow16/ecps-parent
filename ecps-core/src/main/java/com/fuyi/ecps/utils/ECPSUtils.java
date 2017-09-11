package com.fuyi.ecps.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ECPSUtils {
	
	public static String readProp(String key) {
		InputStream in = ECPSUtils.class.getClassLoader().getResourceAsStream("system.properties");
		Properties prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return prop.getProperty(key);
	}

}
