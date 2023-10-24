package anonymous;

interface A3{
	public abstract void abc();
}

// 자식 클래스 직접 생성
class B3 implements A3{
	public void abc() {
		System.out.println("입력매개변수 전달");
	}
}

class C3{
	void cde(A3 a) {
		a.abc();
	}
}

public class AnonymousClass_3 {

	public static void main(String[] args) {
		C3 c = new C3();
		// 방법 1. 클래스명 o + 참조 변수명 o
		A3 a = new B3();
		c.cde(a);
		// 방법 2. 클래스명 o + 참조 변수명 x
		c.cde(a);
	}

}
