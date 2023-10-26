package fileandcharset;

import java.io.UnsupportedEncodingException;

public class UTF16vsUTF8 {

	public static void main(String[] args) throws UnsupportedEncodingException {
		// UTF-16 vs UTF-8
		byte[] b1 = "a".getBytes("UTF-16"); // 문자열 -> byte[]
		byte[] b2 = "a".getBytes("UTF-8"); // 문자열 -> byte[]
		System.out.println(b1.length);
		System.out.println(b2.length);
		for(byte b : b1) {
			System.out.printf("%02X ", b);
		}
		System.out.println();
		for(byte b : b2) {
			System.out.printf("%02X ", b);
		}
		System.out.println();
		System.out.println(new String(b1, "UTF-16"));
		System.out.println(new String(b2, "UTF-8"));
		System.out.println();
		
		
		byte[] b3 = "가나다".getBytes("UTF-16"); // 문자열 -> byte[]
		byte[] b4 = "가나다".getBytes("UTF-8"); // 문자열 -> byte[]
		System.out.println(b3.length);
		System.out.println(b4.length);
		for(byte b : b3) {
			System.out.printf("%02X ", b);
		}
		System.out.println();
		for(byte b : b4) {
			System.out.printf("%02X ", b);
		}
		System.out.println();
		System.out.println(new String(b3, "UTF-16"));
		System.out.println(new String(b4, "UTF-8"));
		System.out.println();
	}

}
