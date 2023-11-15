# 15장. 쓰레드

- 쓰레드
    - **CPU를 사용하는 최소 단위**
    - 프로세스는 무조건 1개 이상의 쓰레드를 갖고 있어야 함
- 멀티 쓰레드 (multi-thread)
    - 2개 이상의 쓰레드가 동작
    - 2개 이상의 쓰레드가 동시에 CPU를 사용한다는 의미
    - **하나의 프로그램을 여러 개의 기능으로 나누어 이를 동시에 실행**
- 멀티 태스킹 (Multi-tasking)
    - **동시에 여러 개의 프로그램을 실행**

## 1. 프로그램, 프로세스, 쓰레드

### 1-1. 프로그램과 프로세스 개념

- 컴퓨터 구성 요소
    - CPU (중앙 처리 장치) + 메모리 + 하드디스크
        - CPU : 연산 수행해 실제 **프로그램 실행 장치**, 가장 빠름
            - 속도 차이의 문제로 **메모리의 프로세스와만 대화함**
                - 프로세스만 CPU를 이용할 수 있는데 **실제 CPU를 사용하는 것은 프로세스 내부의 쓰레드임**
        - 하드디스크 : **데이터 저장 역할**, 가장 느림
        - 메모리 : **저장된 데이터를 CPU로 보내는 역할**
            - 메모리는 CPU보다는 느리지만 거의 근접한 속도로 동작
                - CPU와 비슷한 속도로 대화하며 프로그램 실행
            - 하드디스크에 저장된 프로그램이 메모리에 올라오면 프로세스 상태가 됨
            - 프로그램 전체를 한번에 로딩 X → 필요한 부분만 동적 로딩함
- 프로그램
    - 하드디스크에 저장된 파일들의 모임
    - 명령어들의 모음
- 프로세스(process)
    - 메모리 상에 로딩된 프로그램
- 멀티 프로세스(multi-process)
    - 메모리 상에 2개 이상의 프로세스 동작

### 1-2. 쓰레드의 개념

- 쓰레드
    - **CPU를 사용하는 최소 단위**
    - 프로세스는 무조건 1개 이상의 쓰레드를 갖고 있어야 함

### 1-3. 자바 프로그램에서의 쓰레드 (feat. 멀티 쓰레드)

- 자바로 작성한 프로그램이 실행하면 메모리로 로딩되어 프로세스 상태가 됨
    - .class 파일을 실행하면 JVM은 main 쓰레드를 실행시킴 (처음 실행 시점에는 main 쓰레드 1개만 존재)
- 멀티 쓰레드 (multi-thread)
    - 2개 이상의 쓰레드가 동작
    - 2개 이상의 쓰레드가 동시에 CPU를 사용한다는 의미

### 1-4. 멀티 쓰레드의 필요성

- 영화가 상영될 때, 자막도 동시에 실행되어야 함
    - 2개의 작업이 동시에 수행하기 위해서 반드시 필요함

### 1-5. 쓰레드는 정말 동시에 수행될까?

- 멀티 쓰레드 예시
    - 음악들으며 웹 서핑
- 쓰레드 작업 처리
    - 단일 쓰레드
        - 2개의 작업을 처리할 땐 각 작업은 **순차적(sequential) 으로 처리**됨
    - 멀티쓰레드
        - **동시성과 병렬성을 가지고 처리**됨
            - 작업이 2개의 코어에 나뉘어 할당되고 (병렬성), 각각의 코어는 할당된 작업을 번갈아 실행 (동시성)
                - 동시성 (concurrency)
                    - **매우 짧은 간격**으로 교차 실행되어, 두 작업이 **동시에 실행되는 것처럼 보이는** 것임
                    - (처리 작업 수) > (CPU 코어)
                - 병렬성 (parallelism)
                    - 각각의 작업을 **각각의 코어에 할당해 동시에 실행**되는 것
                    - (처리 작업 수) < (CPU 코어)

## 15-2. 쓰레드의 생성 및 실행

- 쓰레드 생성 방법
    - 방법 1
        - Thread 클래스를 상속받아 **run( ) 을 오버라이딩(재정의)**하는 것
    - 방법 2
        - Runnable 인터페이스 구현한 **Runnable 객체 생성 후 run ( ) 구현**
        - Thread 객체를 생성할 때 앞 단계에서 생성한 Runnable 객체를 생성자로 전달
            - Runnable 객체의 내부에는 start( ) 메서드가 존재하지 않기 때문에 start( )를 갖고 있는 Thread 객체를 생성해야 함
- 쓰레드 실행 방법
    - **Thread 객체 내의 start( ) 메서드 호출**
- run( ) 과 start( )의 차이
    - start( )
        - 새로운 쓰레드 생성/추가를 위한 모든 준비
        - 새로운 쓰레드 위에 run( ) 실행
- 멀티 쓰레드 예시
    - 방법1
        
        ```java
        // Thread 클래스를 상속해 클래스를 생성한 후 쓰레드 2개 생성
        class SMIFileThread extends Thread {
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
        
        public class CreateAndStartThread_M1C1 {
        
        	public static void main(String[] args) {
        		// SMIFileThread 객체 생성 및 시작
        		Thread smiFileThread = new SMIFileThread();
        		smiFileThread.start();
        		
        		// 비디오 프레임 번호 1~5
        		int[] intArray = {1,2,3,4,5};
        		
        		// 비디오 프레임 번호 출력 
        		for(int i=0; i<intArray.length; i++) {
        			System.out.print("(비디오 프레임) "+intArray[i]);
        			try {Thread.sleep(200);}catch(InterruptedException e) {}
        		}
        	}
        
        }
        ```
        
    - 방법2
        
        ```java
        // Runnable 인터페이스를 상속해 클래스를 생성한 후 쓰레드 2개 생성
        class SMIFileRunnable implements Runnable {
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
        
        public class CreateAndStartThread_M1C3 {
        
        	public static void main(String[] args) {
        		// SMIFileThread 객체 생성
        		Runnable smiFileThread = new SMIFileRunnable();
        		Thread thread = new Thread(smiFileThread);
        		thread.start();
        		
        		// 비디오 프레임 번호 1~5
        		int[] intArray = {1,2,3,4,5};
        		
        		// 비디오 프레임 번호 출력 
        		for(int i=0; i<intArray.length; i++) {
        			System.out.print("(비디오 프레임) "+intArray[i]);
        			try {Thread.sleep(200);}catch(InterruptedException e) {}
        		}
        	}
        
        }
        ```
        

## 15-3. 쓰레드의 속성

| 함수 | 설명 |
| --- | --- |
| static Thread Thread.currentThread( ) | 현재 쓰레드 객체 참조값 얻어오기 |
| static int Thread.activeCount( ) | 실행 중인 쓰레드의 개수 가져오기 |
| String setName(String name) | 쓰레드 이름 설정하기 |
| String getName( ) | 쓰레드 이름 가져오기 |
| void setPriority(int priority) | 쓰레드 객체의 우선 순위 정하기 |
| int getPriority( ) | 쓰레드 객체의 우선순위 가져오기 |
- 쓰레드의 우선 순위
    - 모든 쓰레드는 1~10 사이의 우선순위를 갖고 있음 (1 : 가장 낮은 순위)
    - 우선순위를 지정하지 않으면 **기본 값으로 5의 우선순위**를 가짐
    - 우선순위는 동시성과 관계 있음
        - 2개의 쓰레드가 2개의 CPU 코어에 각각 할당돼 동작하는 **쓰레드 병렬성일 때 우선순위는 의미가 없음**
        - 2개의 작업이 하나의 CPU 코어에서 동작할 때 쓰레드의 동시성에 따라 2개의 작업은 일정 시간 간격으로 번갈아가면서 실행 됨
    - **우선순위가 높으면 상대적으로 더 많은 시간을 할당**받게 됨
- 쓰레드의 데몬 설정
    - 데몬 (daemon)
        - 주 스레드의 작업을 돕는 보조적인 역할을 수행하는 스레드
        - 사용자가 신경쓰지 않으면서 백그라운드에서 일하는 것
    - 데몬 쓰레드 (daemon thread)
        - 일반 쓰레드가 보두 종료되면 함께 종료되는 쓰레드
            - ex) 문서 편집 프로그램에서 일정 시간 간격으로 자동 저장을 수행하는 쓰레드가 수행되고 있을 때, 문서 편집 프로그램 자체가 종료되면 자동 저장 쓰레드는 더이상 동작할 필요가 없을 것임.
        - 함수
            - void setDeamon(boolean on) : 데몬 쓰레드 설정 (기본 값 : fasle)
            - boolean isDaemon() : 데몬 쓰레드 설정 확인
            - 예시
                - MyThread2가 아직 실행할 내용이 남아있지만, 데몬 쓰레드로 동작해 main 쓰레드가 종료되면 함께 종료됨
            
            ```java
            // 우선순위
            class MyThread2 extends Thread {
            	@Override
            	public void run() {
            		System.out.println(getName() +": "+(isDaemon()? "데몬쓰레드" : "일반 쓰레드"));
            		for (int i = 0; i < 6; i++) { 
            			System.out.println(getName() + ": " + i + "초");
            			try {Thread.sleep(1000);} catch (InterruptedException e) {}
            		}
            	}
            }
            
            public class ThreadProperties_3_2 {
            
            	public static void main(String[] args) {
            
            		// 데몬 쓰레드
            		Thread thread2 = new MyThread2();
            		thread2.setDaemon(true); // 데몬 쓰레드로 설정
            		thread2.setName("thread2");
            		thread2.start();
            		
            		// 3.5초 후 main 쓰레드 종료
            		try {Thread.sleep(3500);} catch (InterruptedException e) {}
            		System.out.println("main Thread 종료");
            	}
            
            }
            ```
            

## 15-4. 쓰레드의 동기화

### 1. 동기화 개념

- 동기화 (synchronized)
    - **하나의 작업이 완전히 완료된 후 다른 작업을 수행**하는 것
- 비동기 (asynchronous)
    - 하나의 작업 명령 이후 **완료 여부와 상관없이 바로 다른 작업 명령을 수행**하는 것

### 2. 동기화 필요성

- 하나의 쓰레드가 객체를 사용한 후 다른 객체가 사용할 수 있도록 하는 설정

### 3. 자바 동기화 방법

- 메서드 동기화
    - 메서드 리턴 타입 앞에 `synchronized`키워드 추가
        - 성능 문제 존재
        
        ```java
        class MyData{
        		ind data = 3;
        		public synchronized void plusData(){
        				// data 필드의 값을 +1 수행 
        		}
        }
        ```
        
- 블록 동기화
    - 전체 메서드를 통기화 하지 않고, 해당 부분만 동기화
    
    ```java
    class MyData{
    		ind data = 3;
    		public void plusData(){
    				synchronized (this){ 
    						// data 필드의 값을 +1 수행 
    				}
    		}
    }
    ```
    

### 4. 동기화 원리

- 모든 객체는 자신만의 열쇠(key)를 하나씩 가지고 있음
    - 동기화를 사용하면 처음 사용하는 쓰레드가 Key 객체의 열쇠를 가짐
        - 다른 쓰레드는 먼저 사용 중인 쓰레드가 작업을 완료하고 열쇠를 반납할 때까지 대기 (blocked)

## 15-5. 쓰레드의 상태

- 쓰레드는 객체가 생성, 실행, 종료되기까지 다양한 상태를 가짐
- Enum 타입으로 정의 되어 있음
    - `NEW`
        - Thread myThread = new MyThread(); // start 시작 전
    - `RUNNABLE`
        - myThread.strat();
    - `TERMINATED`
        - run 완료
    - `TIMED_WAITING`
        - Thread.sleep(1000)
        - join(1000)
    - `BLOCKED`
    - `WAITING`
        - join( ), wait( ) : 해당 쓰레드가 완료될 때까지 main 쓰레드는 기다리겠다는 의미
        - notify( ), notifyAll( )
- `Thread.yield( )` : 다른 쓰레드에게 CPU 사용을 인위적으로 양보하고, 자신은 실행 대기 상태로 전환