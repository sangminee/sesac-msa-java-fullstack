package basic;

public class OpTest11 {
	public static void main(String[] args) {
		int n = 23;
		
		// n이 양수인지 음수인지 판별
		System.out.println(n >= 0 ? "양수" : 
			               n == 0 ? "0은 양수도 음수도 아님" : 
			            	        "음수"); 
		// 짝수 홀수 판별
		System.out.println(n%2==0 ? "짝수" : "음수"); 
	}
}
