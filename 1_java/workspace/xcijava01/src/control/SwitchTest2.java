package control;

import java.util.Scanner;

public class SwitchTest2 {

	public static void main(String[] args) {
		Scanner sc =new Scanner(System.in);
		System.out.println("0 ~ 100사이의 점수를 칩햑");
		int score = sc.nextInt();
		
		// switch~case 로 변환 
		switch(score / 10) {
		case 10:
		case 9 :
			System.out.println("A");
			break;
		case 8: 
			System.out.println("A");
			break;
		case 7: 
			System.out.println("A");
			break;
		case 6: 
			System.out.println("A");
			break;
		default : 
			System.out.println("F");
			break;
		}
	}

}
