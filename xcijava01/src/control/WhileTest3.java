package control;

public class WhileTest3 {

	public static void main(String[] args) {
		// for문 3개로 구구단 출력
		int a = 2;
		while (a <= 9) {
			int num = 1;
			while (num <= 9) {
				int temp = a;
				while (temp <= a + 4) {
					System.out.print(temp + "*" + num + "=" + a * num + "\t");
					temp++;
				}
				System.out.println();
				temp = a;
				num++;
			}
			a += 4;
			System.out.println();
		}

	}

}
