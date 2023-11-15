package control;

public class WhileTest2 {

	public static void main(String[] args) {
		
		// 1부터 1000까지 정수의 합계
		int sum = 0;
		int a=1;
		while(a<=1000){
			sum += a;
			a++;
		}
		System.out.println(sum);
		
		// 3의 배수의 합계
		// (1)
		int sum2 = 0;
		int b=3;
		while(b<=1000) {
			b+=3;
		}
		
		System.out.println(sum2);
		
		
	}

}
