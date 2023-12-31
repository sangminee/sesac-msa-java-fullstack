package collection;

import java.util.*;

class MyClass1{
	int data1;
	int data2;
	public MyClass1(int data1, int data2) {
		this.data1 = data1;
		this.data2 = data2;
	}
}

class MyComparableClass1 implements Comparable<MyComparableClass1> {
	int data1;
	int data2;
	public MyComparableClass1(int data1, int data2) {
		this.data1 = data1;
		this.data2 = data2;
	}
	// 크기 비교의 기준 설정 (음수, 0, 양수)
	@Override
	public int compareTo(MyComparableClass1 o) {
		if(this.data1 < o.data1) return -1;
		else if(this.data1 == o.data1) return 0;
		else return 1;
	}

	@Override
	public String toString() {
		return "data1 = " + data1 + "을 갖고 있는 클래스";
	}

}

public class TreeMapMethod_2 {

	public static void main(String[] args) {
		// 1. Integer 크기 비교 
		TreeMap<Integer, String> treeMap1 = new TreeMap<Integer,String>();
		Integer intValue1 = new Integer(20);
		Integer intValue2 = new Integer(10);
		treeMap1.put(intValue1, "가나다");
		treeMap1.put(intValue2, "나라다");
		System.out.println(treeMap1.toString());
		
		// 2. String 크기 비교 
		TreeMap<String, Integer> treeMap2 = new TreeMap<String,Integer>();
		String str1 = "가나";
		String str2 = "다라";
		treeMap2.put(str1, 10);
		treeMap2.put(str2, 20);
		System.out.println(treeMap2.toString());
		
		// 3. MyClass 크기 비교 
		
		// 4. MyComparableClass 객체 크기 비교 방법1
		TreeMap<MyComparableClass1, String> treeMap4 = new TreeMap<MyComparableClass1,String>();
		MyComparableClass1 myComparableClass1 = new MyComparableClass1(2,5);
		MyComparableClass1 myComparableClass2 = new MyComparableClass1(2,5);
		treeMap4.put(myComparableClass1, "가나다");
		treeMap4.put(myComparableClass2, "나라다");
		System.out.println(treeMap4);
		
		
		// 5. MyClass 객체 크기 비교 방법2
		TreeMap<MyClass1, String> treeMap5 = new TreeMap<MyClass1,String>(new Comparator<MyClass1>() {
			@Override
			public int compare(MyClass1 o1, MyClass1 o2) {
				if(o1.data1 < o2.data1) return -1;
				else if(o1.data1 == o2.data1) return 0;
				else return 1;
			}
		});
		MyClass1 myClass1 = new MyClass1(2,5);
		MyClass1 myClass2 = new MyClass1(3,3);
		treeMap5.put(myClass1, "가나다");
		treeMap5.put(myClass2, "나라다");
		System.out.println(treeMap5);
	}

}
