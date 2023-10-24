package basic;

public class OpTest4 {

	public static void main(String[] args) {
		int a = 10;
		int b = 4;
		
		System.out.println(a & b);
		
		// 비트 연산
		int i = 10; 
		int j = 5; 
		int temp;
		temp = i;
		j = temp; 
		
		i ^= j;
		i ^= i;
		
		System.out.println(i + "," + j);
		
		
	}

}
