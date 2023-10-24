package oop6;

public class Account {
	int money1;
	static int money2;
	
	public Account(int money) {
		this.money1 += money;
		this.money2 += money;
	}

	@Override
	public String toString() {
		return "money1:"+money1 +" ,money2:" + money2;
	}

	public void welcome() {
		System.out.println("welcome~~~~");
	}
}