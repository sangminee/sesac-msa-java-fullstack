package net.developia.spring01.di102e;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class MessageBeanTest {

	public static void main(String[] args) {
		ApplicationContext context = 
				new GenericXmlApplicationContext("di102e/beaninit.xml");
		MessageBean mb = (MessageBean) context.getBean("messageBean");
		mb.sayHello();
	}

}
