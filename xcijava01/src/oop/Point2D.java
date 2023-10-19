package oop;

public class Point2D {
	private int x; // field
	private int y;
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public void print() {
		System.out.println("x = " + this.getX());
		System.out.println("y = " + this.getY());
	}
	
	/*
	public void setX(int x1) {
		this.x = x1;
	}
	
	public int getX() {
		return x;
	} */
	
	
	
}
