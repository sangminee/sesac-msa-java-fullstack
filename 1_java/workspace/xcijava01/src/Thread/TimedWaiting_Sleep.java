package Thread;

class MyThreadTimedWaiting extends Thread{
	@Override
	public void run() {
		try {
			Thread.sleep(3000);
		}catch(InterruptedException e) {
			System.out.println("-- sleep() 진행 중 interrupt() 발생");
			for(long i=0; i<1_000_000_000L; i++) {} // 시간 지연
		}
	}
}
public class TimedWaiting_Sleep {

	public static void main(String[] args) {
		MyThreadTimedWaiting myThread = new MyThreadTimedWaiting();
		myThread.start();
		
		try {Thread.sleep(100);} catch(InterruptedException e) {}
		System.out.println("MyThread State = " + myThread.getState());
		
		// TIMED_WAITING
		myThread.interrupt();
		try {Thread.sleep(100);} catch(InterruptedException e) {}
		System.out.println("MyThread State = " + myThread.getState());
	}

}
