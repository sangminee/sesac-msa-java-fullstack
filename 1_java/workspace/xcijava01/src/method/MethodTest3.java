package method;

import java.util.Scanner;

public class MethodTest3 {
	
	public static void main(String[] args) {
		// method overloading (메소드 중복정의)
		print(1);
		print(2,3);
		print(4,5,6);
		print(4,5,6,1,15,1253,125,1235,125,125,215,12,11,44,5,23,235,2,35,5,66,2,4,1,3,4);
	}

	private static void print(int... i) { // 가변헝 메서드 (배열로 값을 받아올 수 있음) - since java 5 (jdk1.5)
		/*
		for(int j=0; j<i.length; j++) {
			System.out.print(i[j] + "\t");
		}
		System.out.println();
		*/
		
		for(int j : i) {
			System.out.print(j + "\t");
		}
		System.out.println();
	}

	/*
	private static void print(int i, int j, int k) {
		System.out.println(i + "," + j+ "," + k);
	}

	private static void print(int i, int j) {
		System.out.println(i + "," + j);
	}

	private static void print(int i) {
		System.out.println(i);
	}*/
	
}
