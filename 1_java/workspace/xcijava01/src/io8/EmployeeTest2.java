package io8;

import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class EmployeeTest2 {
	public static void main(String[] args) {
		
		try(FileInputStream   fos = new FileInputStream("src/io8/employee.txt");
			ObjectInputStream oos = new ObjectInputStream(fos)) {
			Employee emp = (Employee) oos.readObject();
			System.out.println("사번\t이름\t급여\t\t부서");
			System.out.println("--------------------------------------");
			System.out.println(emp);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
