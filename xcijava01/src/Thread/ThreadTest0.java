package Thread;

class MyClass{
	
}
public class ThreadTest0 extends MyClass implements Runnable{

	public static void main(String[] args) {
		Thread t = new Thread(new ThreadTest0());
		t.start(); // 멀티 쓰레드 - run 메서드 실행 시킴 
		
		for(int i=0; i<5; i++) {
			System.out.println("main() : " + i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("종료");
	}
	
	public void run() {
		for(int i=0; i<5; i++) {
			System.out.println("run() : " + i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("종료");
	}

}
