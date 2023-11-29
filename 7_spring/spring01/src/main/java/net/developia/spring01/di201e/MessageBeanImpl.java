package net.developia.spring01.di201e;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("di201e/application.properties")
public class MessageBeanImpl implements MessageBean {

	@Value("${name}") private String name;
	@Value("${greeting}") private String greeting;
	@Autowired 
	private FileOutputter fileOutputter;

	@Override
	public void sayHello() {
		System.out.println(name + "님, " + greeting);

		try {
			fileOutputter.outputter(name + "님, " + greeting);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
