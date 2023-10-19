package oop6;

public class AccountTest {

	public static void main(String[] args) {
		System.out.println(Account.money2);
		
		Account a1 = new Account(1000);
		System.out.println(a1);
		Account a2 = new Account(1000);
		System.out.println(a2);
		Account a3 = new Account(1000);
		System.out.println(a3);
		
		System.out.println(a1.hashCode());
		System.out.println(a2.hashCode());
		System.out.println(a3.hashCode());
	}

}
