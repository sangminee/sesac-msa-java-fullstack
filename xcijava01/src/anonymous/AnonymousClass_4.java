package anonymous;

interface A4{
	public abstract void abc();
}

// 자식 클래스 직접 생성
class C4{
	void cde(A4 a) {
		a.abc();
	}
}

public class AnonymousClass_4 {

	public static void main(String[] args) {
		C4 c = new C4();
		// 방법 1. 클래스명 x + 참조 변수명 o
		A4 a = new A4() {
			public void abc() {
				System.out.println("입력매개변수 전달");
			}
		};
		c.cde(a);
		// 방법 2. 클래스명 x + 참조 변수명 x
		c.cde(new A4() {
			public void abc() {
				System.out.println("입력매개변수 전달");
			}
		});
	}

}
