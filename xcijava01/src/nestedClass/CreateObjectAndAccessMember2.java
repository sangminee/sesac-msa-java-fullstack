package nestedClass;

class A3{
	int a = 3;
	static int b = 4; 
	void method1() {
		System.out.println("instacne method");
	}
	static void method2() {
		System.out.println("static method");
	}
	
	// 정적 이너 클래스
	static class B{
		void bcd() {
			System.out.println(b);
			method2();
		}
	}
}
public class CreateObjectAndAccessMember2 {

	public static void main(String[] args) {
		A3.B b = new A3.B();
		b.bcd();
	}

}
