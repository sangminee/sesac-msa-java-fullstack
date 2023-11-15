package oop5;

public class Point2D {
	int x;
	int y;
	
	// constructor overloading
	public Point2D() {
		this(1,2); // 생성자에서 생성자를 호출할 때는, 제일 먼저 수행되어야 함
		System.out.println("Point2D() 수행");
	}
	
	public Point2D(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Point2D(x,y) 수행");
	}
	
}
