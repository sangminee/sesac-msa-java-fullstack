package oop9;

public interface TV {
	// abstract는 생략됨 
	public void powerOn();
	public void channelUp();
	public void channelDown();
	public void soundUp();
	public void soundDown();
	public void powerOff();
	public default void setSpeaker(Speaker speaker){};
}
