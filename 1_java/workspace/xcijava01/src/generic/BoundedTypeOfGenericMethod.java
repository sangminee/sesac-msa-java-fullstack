package generic;

class AClass{
	public <T extends Number> void method1(T t) {
		System.out.println(t.intValue());
	}
}
interface MyInterface{
	public abstract void print();
}
class BClass{
	public <T extends MyInterface> void method1(T t) {
		t.print();
	}
}
public class BoundedTypeOfGenericMethod {

	public static void main(String[] args) {
		AClass a = new AClass();
		a.method1(5.8);
		
		BClass b = new BClass();
		b.method1(new MyInterface() {
			@Override
			public void print() {
				System.out.println("print() 구현");
			}
			
		});
		
	}

}
