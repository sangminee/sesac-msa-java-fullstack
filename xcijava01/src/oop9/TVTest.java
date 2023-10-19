package oop9;

import java.util.Properties;
import java.io.*;

public class TVTest {

	public static void main(String[] args) {
		
		Properties pr = new Properties();
		try {
			pr.load(new FileInputStream("src/oop9/product.properties"));
			String tvClass = pr.getProperty("tv");
			String speakerClass = pr.getProperty("speaker");
			
			Class tvClazz = Class.forName(tvClass);
			Class speakerClazz = Class.forName(speakerClass);
			
			TV tv = (TV) tvClazz.getConstructor(null).newInstance(); // 다운캐스팅
			Speaker sp = (Speaker) speakerClazz.getConstructor(null).newInstance();
			
			tv.setSpeaker(sp); 
			tv.powerOn();
			tv.channelUp();
			tv.channelDown();
			tv.soundUp();
			tv.soundDown();
			tv.powerOff();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
