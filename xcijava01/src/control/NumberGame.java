package control;

import java.util.Scanner;

/**
 * 숫자 3개 맞추기 
 * - strike : 같은 자리, 같은 숫자
 * - ball : 같은 숫자 
 * */
public class NumberGame {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int s, b, count=0; 
		int c1, c2, c3; // 난수 - 서로 다른 값 
		int h1, h2, h3; // 입력한 숫자 
		
		c1 = (int)(Math.random()*10);
		do {
			c2 = (int) (Math.random() * 10);
		} while (c2 == c1);
		do {
			c3 = (int) (Math.random() * 10);
		} while (c3 == c2 || c3 == c1);
		
		do{
			System.out.print("0~9사이의 중복되지 않은 숫자 3개 입력 (ex. 1 2 3) > ");
			
			s = b = 0;	
			h1 = sc.nextInt();
			h2 = sc.nextInt();
			h3 = sc.nextInt();
			
			if(h1 == c1) s++;
			else if(h1 == c2 || h1 == c3) b++;
			
			if(h2 == c2) s++;
			else if(h2 == h1 || h2 == h3) b++;
			
			if(h3 == c3) s++;
			else if(h3 == h1 || h3 == h2) b++;
			
			System.out.println("[" +s + "S " + b +"B]");
			count++;
		
		}while(s != 3);
		System.out.println("축하합니다. " + count+ "번 만에 맞추셨습니다.");
	}

}
