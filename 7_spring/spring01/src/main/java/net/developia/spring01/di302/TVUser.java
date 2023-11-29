package net.developia.spring01.di302;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TVUser { // 생성자 주입 
	public static void main(String[] args){
		ApplicationContext context = 
				new AnnotationConfigApplicationContext("net.developia.spring01.di302");
		
		System.out.println("--------------------------------");
		TV tv = context.getBean(TV.class); // 다운캐스팅 
		tv.powerOn();
		tv.channelUp();
		tv.channelUp();
		tv.soundUp();
		tv.soundUp();
		tv.soundDown();
		tv.powerOff();
	}
}
