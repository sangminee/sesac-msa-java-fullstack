package basic;

public class OpTest14 {
	public static void main(String[] args) {
		// (int)(Math.random() * 만들고싶은 가짓수) + 최소값
		
		// 1~6사이의 난수 발생
		System.out.println((int)(Math.random()*6)+1);
		System.out.println((int)(Math.random()*6)+1);
		System.out.println((int)(Math.random()*6)+1);
		
		// 4~15 사이의 정수 난수 발생
		// 숫자가 12개임 (4 5 6 7 8 9 10 11 12 13 14 15)
		System.out.println((int)(Math.random() * 12)+ 4);
		
		/*
		 * 반드시 아래 숫자로만 난수 발생 
		 * 600  700  800  900  1000
		 * 1100 1200 1300 1400 1500
		 * 1600 1700 1800 1900 2000
		 * 2100 2200 2300
		 * */
		// 6부터 23까지의 랜덤 번호 고르고 100 곱하기 
		System.out.println(((int)(Math.random()*18)+6)*100);
		System.out.println(((int)(Math.random()*18)+6)*100);
		System.out.println(((int)(Math.random()*18)+6)*100);
		System.out.println(((int)(Math.random()*18)+6)*100);
	}
}
