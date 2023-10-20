package usersException;

// 점수가 음수일 때 예외 발생
class MinusException extends Exception{
	public MinusException() {
		super();
	}
	public MinusException(String message) {
		super(message);
	}
}

// 점수가 100점을 초과할 때 예외 발생
class OverExcpetion extends Exception{
	public OverExcpetion() {
		super();
	}
	public OverExcpetion(String message) {
		super(message);
	}
}

class A4{
	void checkScore(int score) throws MinusException, OverExcpetion{
		if(score < 0) {
			throw new MinusException("예외 발생: 음숫값 입력");
		}else if(score > 100) {
			throw new OverExcpetion("예외 발생: 100점 초과");
		}else {
			System.out.println("정상적인 값입니다.");
		}
	}
}
public class UserExceptionExample {

	public static void main(String[] args) {
		A4 a = new A4();
		try {
			a.checkScore(85);
			a.checkScore(150);
		}catch(MinusException|OverExcpetion e) {
			System.out.println(e.getMessage());
		}
	}

}
