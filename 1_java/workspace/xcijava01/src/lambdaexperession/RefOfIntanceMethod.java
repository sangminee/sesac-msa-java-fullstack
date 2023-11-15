package lambdaexperession;

interface A3{
	void abc();
}
class B3{
	void bcd() {
		System.out.println("메서드");
	}
}
public class RefOfIntanceMethod {

	public static void main(String[] args) {
		// 1.익명 이너 클래스
		A3 a1 = new A3() {
			@Override
			public void abc() {
				B3 b = new B3();
				b.bcd();
			}
		};
		
		// 2. 람다식으로 표현
		A3 a2 = () ->{
			B3 b = new B3();
			b.bcd();
		};
		
		// 3. 정의된 인스턴스 메서드 참조 
		B3 b = new B3();
		A3 a3 = b::bcd;
		a1.abc();
		a2.abc();
		a3.abc();
	}

}
