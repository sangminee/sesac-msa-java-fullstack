package control;

public class DoWhileTest2 {
	public static void main(String[] args) {
		int dice1, dice2;
		
		dice1 = (int)(Math.random() * 6)+1;
		do {
			dice2 = (int) (Math.random() * 6) + 1;
		} while (dice1 == dice2);  // 절대 같은 값이 나올 수 없음
		System.out.println(dice1 + "," + dice2);
	}
}
