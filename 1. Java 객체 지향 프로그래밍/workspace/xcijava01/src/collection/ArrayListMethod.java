package collection;

import java.util.*;

public class ArrayListMethod {

	public static void main(String[] args) {
		List<Integer> aList1 = new ArrayList<>();
		aList1.add(3);
		aList1.add(4);
		aList1.add(5);
		System.out.println(aList1.toString());
		
		aList1.add(1,6);
		System.out.println(aList1.toString());
		
		List<Integer> aList2 = new ArrayList<>();
		aList2.add(1);
		aList2.add(2);
		aList2.addAll(aList1);
		System.out.println(aList2);
		
		List<Integer> aList3 = new ArrayList<>();
		aList3.add(1);
		aList3.add(2);
		aList3.addAll(1, aList3);
		System.out.println(aList3);
		
		aList3.set(1, 5);
		aList3.set(3, 6);
		System.out.println(aList3);
		
		aList3.remove(1);
		System.out.println(aList3);
		
		aList3.remove(new Integer(2));
		System.out.println(aList3);
		
		aList3.clear();
		System.out.println(aList3);
		
		System.out.println(aList3.isEmpty());
		System.out.println(aList3.size());
		aList3.add(1);
		aList3.add(2);
		aList3.add(3);
		System.out.println(aList3);
		System.out.println(aList3.size());
		
		System.out.println("0번째: "+aList3.get(0));
		System.out.println("1번째: "+aList3.get(1));
		System.out.println("2번째: "+aList3.get(2));
		
		for(int i=0; i<aList3.size(); i++) {
			System.out.println(i + "번째: "+aList3.get(i));
		}
		
		
		Object[] object = aList3.toArray();
		System.out.println(Arrays.toString(object));
		
		
		Integer[] integer1 = aList3.toArray(new Integer[0]);
		System.out.println(Arrays.toString(integer1));
		
		
		Integer[] integer2 = aList3.toArray(new Integer[5]);
		System.out.println(Arrays.toString(integer2));
	}

}
