package lambdaexperession;

interface A11{
	B11 abc(int k);
}
class B11{
	B11(){
		System.out.println("첫 번째 생성자");
	}
	B11(int k){
		System.out.println("두 번째 생성자");
	}
}
public class RefOfClassConstructor {

	public static void main(String[] args) {
		// 1. 익명 이너 클래스 
		A11 a1 = new A11() {
			@Override
			public B11 abc(int k) {
				// TODO Auto-generated method stub
				return new B11(3);
			}
		};
		
		// 2. 람다식
		A11 a2 = (int k) -> new B11(3);
		
		// 3. 클래스 생성자 참조 
		A11 a3 = B11::new;
		a1.abc(3);
		a2.abc(3);
		a3.abc(3);
		
	}

}
