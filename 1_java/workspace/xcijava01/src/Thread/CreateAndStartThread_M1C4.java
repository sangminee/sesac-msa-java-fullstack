package Thread;

// Runnable 인터페이스를 상속해 클래스를 생성한 후 쓰레드 3개 생성
class SMIFileRunnable3 implements Runnable {
	@Override
	public void run() {
		// 자막 번호 하나 ~ 다섯
		String[] strArray = {"하나", "둘", "셋", "넷", "다섯"};
		try {Thread.sleep(10);}catch(InterruptedException e) {}
		// 자막 번호 출력 
		for(int i=0; i<strArray.length; i++) {
			System.out.println(" - (자막 번호) " + strArray[i]);
			try {Thread.sleep(200);}catch(InterruptedException e) {}
		}
	}
	
}

class VideoFileThread3 implements Runnable{
	@Override
	public void run() {
		// 비디오 프레임 번호 1~5
		int[] intArray = { 1, 2, 3, 4, 5 };
		// 비디오 프레임 번호 출력
		for (int i = 0; i < intArray.length; i++) {
			System.out.print("(비디오 프레임) " + intArray[i]);
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
			}
		}
	}
}

public class CreateAndStartThread_M1C4 {

	public static void main(String[] args) {
		// SMIFileThread 객체 생성 및 시작
		Runnable smiFileThread = new SMIFileRunnable3();
		Thread thread1 = new Thread(smiFileThread);
		thread1.start();

		// VideoFileThread 객체 생성 및 시작
		Runnable videoFileThread = new VideoFileThread3();
		Thread thread2 = new Thread(videoFileThread);
		thread2.start();
	}

}
