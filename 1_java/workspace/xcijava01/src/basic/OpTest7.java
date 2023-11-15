package basic;

public class OpTest7 {

	public static void main(String[] args) {
		int a = 7;
		int t = 4;
		t += a + 3;  // t += (a+3);
		             // t = t + (a + 3);
		
//		int t = ++a;   // a = a + 1;
//		               // t = a;
		
//		int t = ++a;   // t = a;
//                       // a = a + 1;
		System.out.println(a + "," + t);
	}

}
