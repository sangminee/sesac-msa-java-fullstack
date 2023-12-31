package oop4;

public class ShapeTest {

	public static void main(String[] args) {
		printArea(new Circle());
		printArea(new Rectangle());
		printArea(new Triangle());
	}

	private static void printArea(Shape s) {
		s.area();
		
		if(s instanceof Circle) {
			Circle c = (Circle)s;
			System.out.println("반지름이 " + c.r + "인 원의 널이는 " + s.res + "입니다.");
		}else if(s instanceof Rectangle) {
			Rectangle r = (Rectangle)s;
			System.out.println("밑변이 " + r.w + "이고, 높이가 " + r.h +"인 사각형의 널이는 " + r.res + "입니다.");
		}else if(s instanceof Triangle) {
			Triangle t = (Triangle)s;
			System.out.println("밑변이 " + t.w + "이고, 높이가 " + t.h +"인 삼각형의 널이는 " + t.res + "입니다.");
		}
		
	}

}
