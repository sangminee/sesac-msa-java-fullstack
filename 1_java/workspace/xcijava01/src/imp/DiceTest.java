package imp;

import exam.lib.Dice;

public class DiceTest {

	public static void main(String[] args) {
		Dice dice = new Dice();
		int a = dice.roll();
		System.out.println(a);
	}

}
