package basic;

public class OpTest12 {
	public static void main(String[] args) {
		int n = 2;
		System.out.println(
				n == 1 || n == 3 ? "남자" :
				n == 2 || n == 4 ? "여자" :
					 			   "에러"
				);
	}
}
