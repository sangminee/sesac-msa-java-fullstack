package net.developia.spring01.di201;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component(value ="tv")
public class SamsungTV implements TV {

	@Autowired
	@Qualifier("msspeaker")
	private Speaker speaker;

	public SamsungTV() {
		System.out.println("SamsungTV > 생성자 수행");
	}

	public void powerOn() {
		System.out.println("SamsungTV > TV를 켭니다.");
	}

	public void powerOff() {
		System.out.println("SamsungTV > TV를 끕니다.");
	}

	public void channelUp() {
		System.out.println("SamsungTV > 채널을 올립니다.");
	}

	public void channelDown() {
		System.out.println("SamsungTV > 채널을 내립니다.");
	}

	public void soundUp() {
		if (speaker != null) {
			speaker.soundUp();
		} else {
			System.out.println("SamsungTV > 소리를 키웁니다.");
		}
	}

	public void soundDown() {
		if (speaker != null) {
			speaker.soundDown();
		} else {
			System.out.println("SamsungTV > 소리를 줄입니다.");
		}
	}
}
