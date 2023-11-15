package collection;

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

public class ArrayListTest {

	public static void main(String[] args) {
		// 데이터 안정성을 보안할 수 있음 
		List<String> list = Collections.synchronizedList(new ArrayList());
	}

}
