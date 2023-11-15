# 19장. 자바 입출력

자바의 입출력을 이해하려면 자바에서 파일을 관리하는 방법과 문자셋(charset)의 개념을 알 필요가 있음 

## 19-1. 파일 관리와 문자셋

- 자바 File 클래스
    - 파일 (file)
    - 폴더 (directory)

### 1. 자바로 파일 관리하기

- 파일 객체 생성하기
- File 클래스의 주 메서드
    - 절대 경로 : 드라이브(C:/, D:/)부터 특정 위치까지 전체 경로 표시
    - 상대 경로 : 현재 작업 폴더 위치를 기준으로 표시
    
    | 함수 | 설명 | 리턴 값 |
    | --- | --- | --- |
    | exists( ) | 존재 유무 | boolean |
    | mkdir() | 경로 위치에 폴더 생성 | boolean |
    | createNewFile() | 경로 위치에 파일 생성 | boolean  |
    | getAbsolutePath() | 절대 경로 가져오기 | String  |
    | getProperty(String key) | 작업 폴더의 위치 구하기 | String  |
    | isDirectory( ) | 폴더 유무 참, 거짓  | boolean |
    | isFile( ) | 파일 유무 참, 거짓 |  |
    | getName() | 파일 이름 문자열로 리턴 |  |
    | getParent() | 부모 폴더의 이름 문자열로 리턴 |  |
    | list( ) | 경로 내의 폴더와 파일 이름을 문자열 배열로 리턴 |  |
    | listFiles( ) |  |  |

### 2. 자바에서 문자셋 이용하기

- 문자셋 : 어떤 언어를 표현하는 데 사용하는 문자들의 집합
- 아스키(ASCII)
    - 미국 정보 교환 표준 부호의 약자
    - 영문 알파벳, 숫자, 특수 기호, 제어 코드
    - 모든 나라의 문자 표현 X
        - 각 나라는 자신만의 문자셋 존재 (EUC-KR, EUC-JP, EUC-CN)
            - 하나의 웹페이지에서 EUC-KR과 EUC-JP 동시 사용 X
- 한글 전용 문자셋
    - EUC-KR
    - MS949
- 유니코드
    - 다국어 문자 동시 표현 가능
- 대표적인 유니코드 문자셋
    - UTF-16
        - 영문을 포함해 모든 문자를 고정 길이(2byte)로 인코딩하는 방식으로 자바에서 char 자료형(2byte)를 저장하기 위해 사용함
        - byte[ ] 로 분할할 때 앞에 2byte가 추가됨
    - UTF-8
        - 가변 길이 문자 인코딩 방식
        - 웹 서버(Apache, IIS, NginX), 데이터베이스, 리눅스, 맥 시스템 등의 기본 인코딩 방식
        - 한 문자를 표현하기 위해 1~4 byte의 크기를 사용함
            - 영어, 숫자 등 아스키코드 → 1byte 로 표현
            - 유니코드 → 3byte 로 표현
        - 문자열을 변환하거나 파일로 저장할 때 MS949 또는 UTF-8문자셋으로 변환해야
- Charset 클래스로 문자셋 이용하기
- 명시적 문자셋 지정이 필요할 때
- 자바 입출력 (Java IO)
    - 입력 (input)
        - 프로그램을 기준으로 외부로부터 데이터가 들어오는
        - 대상 : 키보드, 마우스, 파일, 네트워크 등
    - 출력 (output)
        - 프로그램에서 외부로 나가는
        - 화면, 프린터, 파일, 네트워크 등

### 19-2. byte 단위 입출력

- 송수신 하고자 하는 데이터를 byte로 쪼개 보내고 받는 것
    - 기본 클래스 : InputStream (입력) & OutputStream (출력)
- InputStream
    - 자식 클래스
        - `FileInputStream`, `BufferedInputStream`, `DataInputStream`
        - `System.in`
    - 주요 메서드
        - `available()` : InputStream에 남은 바이트 수를 리턴
        - `read()` → 3가지로 오버로딩
        - `close()` : InputStream의 자원 반납
- OutputStream
    - 자식 클래스
        - `FileOutputStream`, `BufferedOutputStream`, `DataOutputStream`
        - `System.out`
    - 주요 메서드
        - `flush()` : 메모리 버퍼에 쓰여진 데이터 내보내는 명령
        - `write()`: 모든 데이터를 메모리 버퍼에 연속적으로 출력하는
        - `cloase()` : OutputStream의 자원 반납
- 입출력 필터링
    - InputStream과 OutputStream만으로 데이터 입출력 수행이 가능하지만, byte 단위로 테이터를 출력하다 보니 속도가 느리고 다양한 타입(int, double 등)으로 바로 출력할 수 없음
    - 개선
        - FilterInputStream & FilterOutputStream
            - 대표 클래스
                - Buffered(Input/Output)Stream : 메모리 버퍼 사용
                - Data(Input/Output)Stream
                - PrintStream

### 19-3. char 단위의 입출력