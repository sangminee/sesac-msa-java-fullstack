package generic;

class Parent{
	<T extends Number> void print(T t) {
		System.out.println(t);
	}
}
class Child extends Parent{
	
}
public class InheritanceGenericMethod {

	public static void main(String[] args) {
		
		// 부모 클래스에서 제네릭 메서드 이용
		Parent p = new Parent();
		p.<Integer>print(10);
		p.print(10);
		
		// 자식 클래스에서 제네릭 메서드 이용
		Child c = new Child();
		c.<Double>print(5.8);
		c.print(5.8);
	}

}
