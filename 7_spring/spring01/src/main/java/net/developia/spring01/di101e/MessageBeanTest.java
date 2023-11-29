package net.developia.spring01.di101e;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class MessageBeanTest {

	public static void main(String[] args) {
		ApplicationContext context = 
				new GenericXmlApplicationContext("di101e/beaninit.xml");
		MessageBean mb = (MessageBean) context.getBean("messageBean");
		mb.sayHello();
	}

}
