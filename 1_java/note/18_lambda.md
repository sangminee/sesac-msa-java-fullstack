# 18. 람다식

## 18-1. 람다식

- 람다식 (Lambda expression) : 객체 지향형 언어인 자바에서 함수형 프로그래밍 방식을 쓸 수 있게 해주는 문법 요소 (Java 8 이상)
        
    - 자바는 일반적으로 객체 지향 언어이므로 모든 함수는 클래스나 인터페이스 내부에만 존재해야 함(외부에 독립적으로 함수를 구성할 수 없음)    
        - 함수 (function) : 기능, 동작을 정의
        - 메서드 (method) : 클래스 또는 인터페이스 내부에서 정의된 함수
    - 새로운 함수 문법을 정의하는 대신, 이미 있는 인터페이스의 문법을 활용해 람다식을 표현
        - 단 하나의 추상 메서드만을 포함하는 인터페이스를 함수형 인터페이스라고 하고, 이 함수형 인터페이스의 호출 및 기능을 구현하는 방법을 새롭게 정의한 문법이 람다식임
    - 람다식은 익명 이너 클래스의 축약된 형태라고 볼 수 있음

## 18-2. 람다식의 활용

    - 람다식
        - 익명 이너 클래스 내부 구현 메서드의 약식 표현
        - 메서드 참조와 생성자 참조에 사용
    - 구현 메서드의 약식 표현
        - 직접 추상 메서드 구현
        - 익명 이너 클래스를 이용한 객체 생성 방식의 축약된 표현 제공


### 1) 메서드 참조

- 이미 구현이 완료된 메서드 참조
    
    ```java
    interface A{
    	void abc();
    }
    
    class B{
    	void bcd() {
    		System.out.println("메서드");
    	}
    }
    
    // 익명 이너 클래스 
    A a = new A(){
    		public void abc(){
    					B.bcd();
    		}
    };
    
    // 람다식 
    A a = () -> {
    		B.bcd();
    };
    ```
    
    - 정의되어 있는 인스턴스 메서드 참조
        
        ```java
        B b = new B();
        
        // A 인터페이스 내부의 abc() 메서드는 참조 변수 b 객체 내부의 인스턴스 메서드 bcd()동일
        A a3 = b::bcd; 
        ```
        
    - 정의되어 있는 정적 메서드 참조
        - 정적 메서드는 객체 생성없이 클래스명으로 바로 사용할 수 있기 때문에 객체의 생성없이 바로 클래스명을 사용함
        - `클래스명::정적 메서드명`
        
        ```java
        A a = B::bcd;
        ```
        

### 2) 생성자 참조
- 배열 객체 생성자
- 클래스 객체 생성자