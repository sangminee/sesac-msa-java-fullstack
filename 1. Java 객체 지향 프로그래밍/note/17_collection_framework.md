# 17장. 컬렉션 프레임워크

## 17-1. 컬렉션 프레임워크의 개념과 구조

- 컬렉션 프레임 워크
    - 컬렉션 (collection)
        - 동일한 타입을 묶어 관리하는 자료구조
        - 저장 용량을 동적으로 관리
        - 모든 컬렉션은 객체만 저장됨
    - 프레임워크 (framework)
        - 클래스와 인터페이스의 모음 (라이브러리)
            - 라이브러리 : 단순히 연관된 클래스와 인터페이스들의 묶음
        - 클래스의 정의에 설계 원칙 또는 구조가 존재
    - 컬렉션 프레임워크 (collection framework)
        - 리스트, 스택, 큐, 트리 등의 자료구조에 정렬, 탐색 등의 알고리즘을 구조화해 놓은 프레임워크

## 17-2. List<E> 컬렉션 인터페이스

1. 배열 (array)
    - 저장 공간의 크기가 고정적
2. `List<E>`
    - 저장 공간 동적으로 변화 가능
    - 인터페이스→ 스스로 객체 생성 x
    - 구현 클래스
        - `ArrayList<E>`
            - 데이터 추가 : `add( )`
            - 데이터 변경 : `set( )`
            - 데이터 삭제 : `remove( )`, `clear( )`
            - 데이터 정보 추출 : `isEmpty( )` , `Size( )` , `get(int index)`
            - 배열로 변환(List → Array) : `toArray( )`  , `toArray(T[] t)`
        - `Vector<E>`
            - ArrayList<E>와 메서드 기능 및 사용법 동일
            - ArrayList 와 차이점
                - Vector의 주요 메서드는 동기화 메서드 (synchronized method)로 구현돼 있으므로 멀티 쓰레드에 적합하도록 설계되어 있음
        - `LinkedList<E>`
            - ArrayList 와 차이점
                - ArrayList<E>가 모든 데이터를 위치 정보(인덱스)와 값으로 저장하는 반면, LinkedList<E>는 앞 뒤 객체의 정보를 저장함 (모든 데이터가 서로 연결된 형태로 관리됨)
                - 성능 비교
                
                | 구분 | ArrayList<E> | LinkedList<E> |
                | --- | --- | --- |
                | 추가, 삭제(add, remove) | 속도 느림 | 속도 빠름 |
                | 검색 (get) | 속도 빠름 | 속도 느림 |

## 17-3. Set<E> 컬렉션 인터페이스

1. `Set<E>`
    - 인덱스 정보가 포함되어 있지 않은, 집합의 개념과 같음
    - 데이터 중복 X
2. 구현 클래스
    - `HashSet<E>`
        - 메서드
             - 데이터 추가 : `add( )`
            - 데이터 삭제 : `remove( )`, `clear( )`
            - 데이터 정보 추출 : `isEmpty( )` , `contains( )` , `size( )` , `iterator( )`
                - iterator( ) 메서드
                    - `hasNext( )` : 다음으로 가리킬 원소의 존재 여부를 boolean으로 리턴
                    - `next( )` : 다음 원소 위치로 가서 읽은 값을 리턴
                - 배열로 변환(List → Array) : `toArray( )`  , `toArray(T[] t)`
            - 중복 확인 메거니즘
                - 사전 지식
                    - 해시코드(hashcode) : 객체가 저장된 주소를 기준으로 생성된 정수의 고유값 (실제 주소 값 x)
                    - 등가연산자(==) : 스택 메모리 값을 비교
                        - 기본 자료형과 참조 자료형은 스택에 각
                    - equal( ) 메서드
    - `LinkedHashSet<E>`
         - 출력 순서가 항상 입력 순서와 동일함
    - `TreeSet<E>`
        - 데이터를 입력 순서와 상관없이 크기 순으로 출력
        - 메서드            
            |  |  |  |
            | --- | --- | --- |
            | 데이터 검색 | first( ) | Set 원소 중 가장 작은 원소 값 리턴 |
            |  | last( ) | Set 원소 중 가장 큰 원소 값 리턴 |
            |  | lower(E element) | 매개변수로 입력된 원소보다 작은, 가장 큰 수  |
            |  | higher(E element) | 매개변수로 입력된 원소보다 큰, 가장 작은 수 |
            |  | floor(E element) | 매개변수로 입력된 원소보다 같거나 작은 가장 큰 수   |
            |  | ceiling(E element) | 매개변수로 입력된 원소보다 같거나 큰 가장 작은 수 |
            | 데이터 꺼내기 | pollFirst() |  |
            |  | pollLast() |  |

## 17-4. Map<K, V> 컬렉션 인터페이스

- Map
    - Key와 value 한 쌍으로 데이터를 저장함
    - Key 값의 중복 X
    - 데이터를 엔트리 단위로 입력 받음
    - 대표적인 구현 클래스
        - `HashMap<K, V>`
            - 입출력 순서 동일하지 않음
        - `HashTable<K, V>`
        - `LinkedHashMap<K, V>`
        - `TreeMap<K, V>`
            - 키 값의 순서대로 정렬

### 17-5. Stack<E> 컬렉션 클래스

- Stack
    - 클래스이기 때문에 자체적으로 객체 생성 가능
    - LIFO
        - 나중에 입력된 데이터가 먼저 출력
    - 주요 메서드
        - 데이터 추가 : `push()`
        - 데이터 확인 : `peek()`
        - 데이터 위치 검색 : `search()`
        - 데이터 추출 : `pop()`
        - empty 여부 검사 : `empty()`