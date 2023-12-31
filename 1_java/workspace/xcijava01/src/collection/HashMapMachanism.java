package collection;

import java.util.*;

class A1{
	int data;
	public A1(int data) {
		this.data = data;
	}
}
class B1{
	int data;
	public B1(int data) {
		this.data = data;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof B1) {
			if(this.data == ((B1)obj).data) {
				return true;
			}
		}
		return false;
	}
}
class C1{
	int data;
	public C1(int data) {
		this.data = data;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof C1) {
			if(this.data == ((C1)obj).data) {
				return true;
			}
		}
		return false;
	}
	@Override
	public int hashCode() {
		return Objects.hash(data);
	}
}
public class HashMapMachanism {

	public static void main(String[] args) {
		// 1. 어떤 것도 오버리이딩하지 않음
		Map<A1, String> hashMap1 = new HashMap<>();
		A1 a1 = new A1(3);
		A1 a2 = new A1(3);
		System.out.println(a1 == a2);
		System.out.println(a1.equals(a2));
		System.out.println(a1.hashCode() +", "+a2.hashCode());
		hashMap1.put(a1, "첫 번째");
		hashMap1.put(a2, "두 번째");
		System.out.println(hashMap1.size());
		System.out.println();
		
		// 2. equals 메서드만 오버라이딩
		Map<B1, String> hashMap2 = new HashMap<>();
		B1 b1 = new B1(3);
		B1 b2 = new B1(3);
		System.out.println(b1 == b2);
		System.out.println(b1.equals(b2));
		System.out.println(b1.hashCode() +", "+b2.hashCode());
		hashMap2.put(b1, "첫 번째");
		hashMap2.put(b2, "두 번째");
		System.out.println(hashMap2.size());
		System.out.println();
		
		// 3. equals + hashCode 메서드 오버라이딩
		Map<C1, String> hashMap3 = new HashMap<>();
		C1 c1 = new C1(3);
		C1 c2 = new C1(3);
		System.out.println(c1 == c2);
		System.out.println(c1.equals(c2));
		System.out.println(c1.hashCode() +", "+c2.hashCode());
		hashMap3.put(c1, "첫 번째");
		hashMap3.put(c2, "두 번째");
		System.out.println(hashMap3.size());
		System.out.println();
		
	}

}
