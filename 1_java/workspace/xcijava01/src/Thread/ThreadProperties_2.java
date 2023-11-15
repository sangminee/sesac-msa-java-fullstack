package Thread;

// 우선순위
class MyThread extends Thread {
	@Override
	public void run() {
		for (long i = 0; i < 1_000_000_000; i++) { // 시간 지연용
			System.out.println(getName() + " 우선순위: " + getPriority());
		}
	}
}

public class ThreadProperties_2 {

	public static void main(String[] args) {

		// CPU 코어 수
		System.out.println("코어 수: " + Runtime.getRuntime().availableProcessors());

		// 우선순위 자동 지정
		for (int i = 0; i < 3; i++) {
			Thread thread = new MyThread();
			thread.start();
		}

		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
		}
		
		Thread[] thread = new Thread[3];
		
		// 우선순위 직접 지정
		for (int i = 0; i < thread.length; i++) {
			thread[i] = new MyThread();
			thread[i].setName(i + "번째 쓰레드");
			if(i == thread.length) thread[i].setPriority(10); // 가장 마지막에 실행된 쓰레드 객체에 가장 높은 우선순위 부여
			thread[i].start();
		}

	}

}
