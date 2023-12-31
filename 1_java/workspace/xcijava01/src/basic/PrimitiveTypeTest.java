package basic;

import java.math.BigDecimal;

public class PrimitiveTypeTest {

	public static void main(String[] args) {
		boolean b = true; // 오른쪽 값이 왼쪽의 값을 할당한다 
		System.out.println(b);
		
		byte b2 = 127; // 128 error 발생
		System.out.println(b2);
		
		char c = '가';
		System.out.println(c);
		char 뷁 = '헐';
		System.out.println(뷁);
		
		short s = 32767;
		System.out.println(s);
		
		int i = 2147483647 + 1;
		System.out.println(i);
		
		long l1 = 2147483647L;
		System.out.println(1l);
		
		double p = 3.1415926535;
		System.out.println(p);
		
		float p2 = 3.1415926535f;
		System.out.println(p2);
		
		System.out.println(2 - 1.1);
		// 정밀 하게 계산 됨 
		BigDecimal bd1 = new BigDecimal("2");
		BigDecimal bd2 = new BigDecimal("1.1");
		System.out.println(bd1.subtract(bd2));
		
	}

}
