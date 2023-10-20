package exception;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class ExceptionTest1 {

	public static void main(String[] args) throws FileNotFoundException{
		FileInputStream fis = new FileInputStream("txt.txt");
	}

}