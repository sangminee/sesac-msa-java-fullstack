package io8;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Employee implements Serializable {
	private int no;
	private String name;
	private int salary;
	private String dname;
	
	public Employee(int no, String name, int salary, String dname) {
		this.no = no;
		this.name = name;
		this.salary = salary;
		this.dname = dname;
	}

	@Override
	public String toString() {
		return no + "\t" + name + "\t" + salary + "\t" + dname;
	}
}
