package collection;

import java.util.*;

public class TreeSetMethod_1 {

	public static void main(String[] args) {
		TreeSet<Integer> treeSet = new TreeSet<>();
		for(int i=50; i>0; i-=2) {
			treeSet.add(i);
		}
		System.out.println(treeSet.toString());
		
		System.out.println(treeSet.first());
		System.out.println(treeSet.last());
		System.out.println(treeSet.lower(26));
		System.out.println(treeSet.higher(26));
		System.out.println(treeSet.floor(25));
		System.out.println(treeSet.floor(26));
		System.out.println(treeSet.ceiling(25));
		System.out.println(treeSet.ceiling(26));
		
		int treeSetSize = treeSet.size();
		System.out.println(treeSetSize);
		for(int i=0; i<treeSetSize; i++) {
			System.out.println(treeSet.pollFirst()+ " ");
		}
		System.out.println();
		System.out.println(treeSet.size());
		
		// 8. 
		for(int i=50; i>0; i-=2) {
			treeSet.add(i);
		}
		treeSetSize = treeSet.size();
		System.out.println(treeSetSize);
		for(int i=0; i<treeSetSize; i++) {
			System.out.println(treeSet.pollLast()+ " ");
		}
		System.out.println();
		System.out.println(treeSet.size());
		
		// 9. 
		for(int i=50; i>0; i-=2) {
			treeSet.add(i);
		}
		SortedSet<Integer> sSet = treeSet.headSet(20);
		System.out.println(sSet.toString());
		NavigableSet<Integer> nSet = treeSet.headSet(20, true);
		System.out.println(nSet.toString());
		
		// 11. 
		sSet = treeSet.tailSet(20);
		System.out.println(sSet.toString());
		
		// 12. 
		nSet = treeSet.tailSet(20, true);
		System.out.println(nSet.toString());
		nSet = treeSet.tailSet(20, false);
		System.out.println(nSet.toString());
		
		// 13. 
		sSet = treeSet.subSet(10, 20);
		System.out.println(sSet.toString());
		
		// 14. 
		nSet = treeSet.subSet(10,true,20,false);
		System.out.println(nSet.toString());
		nSet = treeSet.subSet(10,false,20,true);
		System.out.println(nSet.toString());
	
		// 15. 
		System.out.println(treeSet);
		NavigableSet<Integer> descendingSet = treeSet.descendingSet();
		System.out.println(descendingSet);
		descendingSet = descendingSet.descendingSet();
		System.out.println(descendingSet);
	}

}
