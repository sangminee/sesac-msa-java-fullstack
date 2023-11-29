package net.developia.spring01.di301;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanInit { // XML -> Java 

	@Bean
	public TV tv() {
		return new SamsungTV();
	}
	
	@Bean
	public Speaker speaker() {
		return new MarshallSpeaker();
	}
}
