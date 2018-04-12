package org.danyuan.utils.pwntcha;

import java.io.File;

// 读取文件
public class Readhtml_Oracle {
	
	//读取本地文件
	public static void main(String[] args) {
		String path = "D:/a/";
		test(path);
	}
	
	private static void test(String path) {
		
		File file = new File(path);
		
		File[] fs = file.listFiles();
		
		if (fs == null) {
			return;
		}
		for (File f : fs) {
			if (f == null) {
				continue;
			}
			if (f.isFile() && f.getName().endsWith(".jpeg")) {
				//System.out.println(f.getAbsolutePath());
				String uid = f.getAbsolutePath().substring(f.getAbsolutePath().lastIndexOf("\\"), f.getAbsolutePath().length()).replaceAll("\\\\", "").replaceAll(".html", "");
				System.out.println(uid);
				int y = Integer.valueOf(uid.replaceAll(".jpeg", ""));
				System.out.println(y);
				try {
					String text = ImagePreProcess.getAllOcr(f.getAbsolutePath(), y);
					System.out.println(y + ".jepg = " + text);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//File in = new File(f.getAbsolutePath());
			} else if (f.isDirectory()) {
				test(f.getAbsolutePath());
			}
		}
	}
}