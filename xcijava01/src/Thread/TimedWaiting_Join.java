package Thread;

class MyThreadTimedJoin1 extends Thread{
	@Override
	public void run() {
		for(long i=0; i<1_000_000_000L; i++) {} // 시간 지연
	}
}

class MyThreadTimedJoin2 extends Thread{
	MyThreadTimedJoin1 myThreadTimedJoin1;
	public MyThreadTimedJoin2(MyThreadTimedJoin1 myThreadTimedJoin1) {
		this.myThreadTimedJoin1 = myThreadTimedJoin1;
	}
	@Override
	public void run() {
		try {
			Thread.sleep(3000);
		}catch(InterruptedException e) {
			System.out.println("-- sleep(...) 진행 중 interrupt() 발생");
			for(long i=0; i<1_000_000_000L; i++) {} // 시간 지연
		}
	}
}

public class TimedWaiting_Join {

	public static void main(String[] args) {
		// 객체 생성
		MyThreadTimedJoin1 thread1 = new MyThreadTimedJoin1();
		MyThreadTimedJoin2 thread2 = new MyThreadTimedJoin2(thread1);
		thread1.start();
		thread2.start();
		
		try {Thread.sleep(100);} catch(InterruptedException e) {}
		System.out.println("MyThread State = " + thread1.getState());
		System.out.println("MyThread State = " + thread2.getState());
		
		// TIMED_WAITING
		thread2.interrupt();
		try {Thread.sleep(100);} catch(InterruptedException e) {}
		System.out.println("MyThread State = " + thread1.getState());
		System.out.println("MyThread State = " + thread2.getState());
	}

}
