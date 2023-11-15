package fileandcharset;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class OutputStreamWriter_1 {

	public static void main(String[] args) {
		// 1. FileWriter를 이용해 데이터 쓰기 (UTF-8)
		File outputStreamWriter1 = new File("src/fileandcharset/files/OutputStreamWiter1.txt");

		try (Writer writer = new FileWriter(outputStreamWriter1);) {
			writer.write("outputStreamWriter1 예제 파일입니다. \n".toCharArray());
			writer.write("한글과 영문이 모두 포함되어 있습니다.");
			writer.write('\n');
			writer.write("Good Bye!!! \n\n\n");
			writer.flush();
		} catch (Exception e) {}
		
		// 2.
		File outputStreamWriter2 = new File("src/fileandcharset/files/OutputStreamWiter2.txt");
		try (OutputStream os = new FileOutputStream(outputStreamWriter1);) {
			OutputStreamWriter osw = new OutputStreamWriter(os,"MS949");
			osw.write("outputStreamWriter2 예제 파일입니다. \n".toCharArray());
			osw.write("한글과 영문이 모두 포함되어 있습니다.");
			osw.write('\n');
			osw.write("Good Bye!!! \n\n\n");
			osw.flush();
			System.out.println(osw.getEncoding());
		} catch (Exception e) {}
	}

}
