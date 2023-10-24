package control;

public class SwitchTest {

	public static void main(String[] args) {
		int n = 4;
		
		switch(n) {
		case 1:
		case 3:
			System.out.println("남");
			break;
		case 2:
		case 4:
			System.out.println("여");
			break;
		default : 
			System.out.println("에러");
			break;
		}
	}

}
