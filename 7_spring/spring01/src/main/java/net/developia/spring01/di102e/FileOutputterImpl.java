package net.developia.spring01.di102e;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileOutputterImpl implements FileOutputter{
	private String name;
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public void outputter(String msg) throws IOException {
		File file = new File(name);
		FileWriter fw = new FileWriter(file);
		fw.write(msg);
		fw.close();
	}
}
