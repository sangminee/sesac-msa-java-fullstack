package control;

public class ForTest2 {

	public static void main(String[] args) {
		
		// 1부터 1000까지 정수의 합계
		int sum = 0;
		for(int i=1; i<=1000; i++) {
			sum += i;
		}
		System.out.println(sum);
		
		// 3의 배수의 합계
		// (1)
		int sum2 = 0;
		for(int i=1; i<=1000; i++) {
			if(i % 3 == 0) sum2 += i;
		}
		// (2)
		for(int i=3; i<=1000; i+=3) {
			sum2+=i;
		}
		
		System.out.println(sum2);
		
	}

}
