package control;

public class ForTest3 {

	public static void main(String[] args) {
		// for문 3개로 구구단 출력 
		// 한번에 생각하지 말고 -> 우선 한 축을 만들기  
		for(int i=2; i<=9; i+=4) {
			for(int j=1; j<=9; j++) {			
				for(int k=i; k<i+4; k++) {
					System.out.print(k + "*" + j + "=" + 2*j + "\t");
				}
				System.out.println();
			}
			System.out.println();
		}
		
		
		////////////////////////////////////////
		// for문 3개로 구구단 출력 
		for(int k=1; k<=2; k++) {
			for(int i=1; i<=9; i++) {
				for(int j=1; j<=4; j++) {
					int a = (k-1)*4 + j+1;
					int b = i;
					System.out.print(a + "*" + b + "=" + a*b +"\t");
				}
				System.out.println();
			}
			System.out.println();
		}
		
		
//		for(int i=2; i<=9; i++) {
//			for(int j=1; j<=9; j++) {
//				System.out.println(i + "*" + j + "=" + 2*j);
//			}
//			System.out.println();
//		}
	}

}
