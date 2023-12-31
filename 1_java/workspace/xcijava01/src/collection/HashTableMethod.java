package collection;

import java.util.*;

public class HashTableMethod {

	public static void main(String[] args) {
		Map<Integer, String> hMap1 = new Hashtable<Integer, String>();

		// 1. put
		hMap1.put(2, "나다라");
		hMap1.put(1, "가나다");
		hMap1.put(3, "다라마");
		System.out.println(hMap1.toString());

		// 2. putAll
		Map<Integer, String> hMap2 = new Hashtable<Integer, String>();
		hMap2.putAll(hMap1);
		System.out.println(hMap2.toString());

		// 3.
		hMap2.replace(1, "가가가");
		hMap2.replace(4, "라라라"); // 동작하지 않음
		System.out.println(hMap2.toString());

		// 4.
		hMap2.replace(1, "가가가", "나나나");
		hMap2.replace(4, "다다다", "라라라"); // 동작하지 않음
		System.out.println(hMap2.toString());

		// 5.
		System.out.println(hMap2.get(1));
		System.out.println(hMap2.get(2));
		System.out.println(hMap2.get(3));

		// 6.
		System.out.println(hMap2.containsKey(1));
		System.out.println(hMap2.containsKey(5));

		// 7.
		System.out.println(hMap2.containsValue("나나나"));
		System.out.println(hMap2.containsValue("다다다"));

		// 8.
		Set<Integer> keySet = hMap2.keySet();
		System.out.println(keySet.toString());

		// 9.
		Set<Map.Entry<Integer, String>> entrySet = hMap2.entrySet();
		System.out.println(entrySet.toString());

		// 10.
		System.out.println(hMap2.size());

		// 11.
		hMap2.remove(1);
		hMap2.remove(4);
		System.out.println(hMap2.toString());

		// 12.
		hMap2.remove(2, "나다라");
		hMap2.remove(3, "다다다");
		System.out.println(hMap2.toString());

		// 13.
		hMap2.clear();
		System.out.println(hMap2.toString());
	}

}
