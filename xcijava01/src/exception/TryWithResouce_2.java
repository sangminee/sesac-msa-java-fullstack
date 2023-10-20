package exception;

class At implements AutoCloseable{
	String resource;
	At(String resource){
		this.resource = resource;
	}
	@Override
	public void close() throws Exception {
		if(resource != null) {
			resource = null;
			System.out.println("리소스가 해제되었습니다.");
		}
	}
}
public class TryWithResouce_2 {

	public static void main(String[] args) {
		System.out.println("문자를 입력하세요!");
		
		// 1. 리소스를 사용하고 finally에서 리소스 수동 해제하기 
		At a1 = null;
		try {
			a1 = new At("특정파일");
		}catch(Exception e) {
			System.out.println("예외 처리");
		}finally {
			// 리소스 수동 해제
			if(a1.resource!=null) {
				try {
					a1.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
		// 2. 리소스 자동 해제
		try (At a2 = new At("특정파일")){
		}catch(Exception e) {
			System.out.println("예외 처리");
		}
		
	}

}
