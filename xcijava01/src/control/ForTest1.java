package control;

import java.util.Scanner;

public class ForTest1 {

	public static void main(String[] args) {
		for(int i=1; i<=3; i++) {
			System.out.println(i*10 + "황수연");
		}
		System.out.println("종료");
		
		
		Scanner sc =new Scanner(System.in);
		System.out.println("0 ~ 100사이의 점수를 칩햑");
		int score = sc.nextInt();
		
		if(90 <= score && score <= 100) System.out.println("A");
		else if(80 <= score && score <= 90) System.out.println("B");
		else if(70 <= score && score <= 80) System.out.println("C");
		else if(60 <= score && score <= 70) System.out.println("D");
		else System.out.println("F");
	
	}

}
