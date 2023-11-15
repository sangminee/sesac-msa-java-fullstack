package lambdaexperession;

interface A1{ // 입력 x, 리턴 x
	void method1();
}
interface B1{ // 입력 O, 리턴 X
	void method2(int a);
}
interface C1{ // 입력 x, 리턴 O
	int method3();
}
interface D1{ // 입력 O, 리턴 O
	double method4(int a, int b);
}
public class FunctionToLambdaExpression {

	public static void main(String[] args) {
		// 인터페이스의 함수 구현 -> 람다식
		// 1. 
		// 1-1. 익명 이너 클래스 방식
		A1 a1 = new A1() {
			@Override
			public void method1() {
				System.out.println("입력 x 리턴 x 함수");
			}
		};
		
		// 1-2. 람다식 표현
		A1 a2 = () -> {System.out.println("입력 x 리턴 x 함수");};
		A1 a3 = () -> System.out.println("입력 x 리턴 x 함수"); // 1줄 명령이면 중괄호 생략
		
		// 2. 
		// 2-2. 익명 이너 클래스 방식
		B1 b1 = new B1() {

			@Override
			public void method2(int a) {
				System.out.println("입력 o 리턴 x 함수");
			}
			
		};
		
		// 2-3. 람다식 표현 
		B1 b2 = (int a)->{System.out.println("입력 o 리턴 x 함수");};
		B1 b3 = (a)-> System.out.println("입력 o 리턴 x 함수"); // 입력매개변수 생략 가능
		B1 b4 = (a) -> System.out.println("입력 o 리턴 x 함수");
		B1 b5 = a -> System.out.println("입력 o 리턴 x 함수");
		
		// 3. 
		// 3-1. 
		C1 c1 = new C1() {
			@Override
			public int method3() {
				return 4; 
			}
		};
		
		// 3-2. 
		C1 c2 = () -> {return 4;};
		C1 c3 = () -> 4;
		
		// 4. 
		// 4-1.
		D1 d1 = new D1() {
			@Override
			public double method4(int a, int b) {
				return a+b;
			}
		};
		// 4-2. 
		D1 d2 = (int a, int b) -> {return a+b ;};
		D1 d3 = (a,b)-> {return a+b;};
		D1 d4 = (a,b)-> a+b;
	}

}
