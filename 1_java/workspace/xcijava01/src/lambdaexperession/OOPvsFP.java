package lambdaexperession;

@FunctionalInterface // 람다식을 만들기 위한 - Java 8에 등장 
interface A{
	void abc();
}
class B implements A{

	@Override
	public void abc() {
		System.out.println("메서드 내용1");
	}
	
}
public class OOPvsFP {

	public static void main(String[] args) {
		// 1. 객체 지향 프로그래밍 문법 1
		A a1 = new B();
		a1.abc();
		// 2. 객체 지향 프로그래밍 문법 2(익명 이너 클래스 사용)
		A a2 = new A() {
			@Override
			public void abc() {
				System.out.println("메서드 내용2");
			}
		};
		a2.abc();
		
		// 3. 함수형 프로그래밍 문법(람다식)
		A a3 = ()->{System.out.println("메서드 내용3");};
		a3.abc();
	}
}
