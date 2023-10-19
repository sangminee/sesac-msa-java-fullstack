package opp7;

public class Singleton {
	public static Singleton singleton = null;
	
	int score;
	private Singleton() {}
	
	public static Singleton getSingleton() {
		if(singleton == null) {
			singleton = new Singleton();
		}
		return singleton;
	}
	
	// 1. 생성자를 private : 외부에서 접근 x
	// 2. 자기 자신을 참조하는 변수를 static으로 선언
	// 3. 처음 1회만 인스턴스를 생성하고 리텅하는 메소드 
	
}
