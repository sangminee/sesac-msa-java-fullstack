package basic;

public class OpTest13 {
	public static void main(String[] args) {
		double n = 10; // 묵시적 형변환 (자동 형변환)
		System.out.println(n);
		
		int p = (int) 3.14; // 명시적 형변환 (강제 형변환) 
		System.out.println(p);
	}
}
