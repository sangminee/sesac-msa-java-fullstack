package array;

public class ArrayTest2 {

	public static void main(String[] args) {
		// [행][열]
		int[][] score = {  
				{100, 90, 80, 70},
				{90 , 80, 70, 60},
				{80, 70, 60, 50}
		};
		
		// 행의 개수 : score.length
		System.out.println("국어\t영어\t수학\t철학\t총점\t평균");
		for(int row=0; row<score.length; row++) {
			int sum = 0;
			for(int col=0; col<score[row].length; col++) {
				sum += score[row][col];
				System.out.print(score[row][col] +"\t");
			}
			System.out.println(sum +"\t" + sum/score[row].length);
		}
		
		System.out.println();
		for(int[] row : score) {
			int sum = 0;
			for(int col : row) {
				sum += col;
				System.out.print(col +"\t");
			}
			System.out.println(sum +"\t" + sum/row.length);
		}
		
		
		System.out.println("종료");
	}

}