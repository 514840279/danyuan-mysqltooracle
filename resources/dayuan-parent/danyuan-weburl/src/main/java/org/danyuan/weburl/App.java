package org.danyuan.weburl;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.danyuan.utils.files.TxtFilesReader;
import org.danyuan.weburl.bean.WebUrl;
import org.danyuan.weburl.controll.Centroller;
import org.danyuan.weburl.controll.RootUrlControll;

/**
 * Hello world!
 */
public class App {
	public static void main(String[] args) {
		// 配置文件的路径
		String path = System.getProperty("user.dir") + Constant._CONTROLL_NAME;
		// 配置文件内的文件路径列表
		List<String> strlist = TxtFilesReader.readFileByLines(path);
		RootUrlControll.managerRootUrlIndex(strlist);
		
		List<WebUrl> list = new ArrayList<WebUrl>();
		for (String string : strlist) {
			WebUrl url = new WebUrl();
			url.setUrl(string);
			list.add(url);
		}
		// 文件信息清空
		File file = new File(path);
		try {
			@SuppressWarnings({ "resource", "unused" })
			FileWriter fWriter = new FileWriter(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 运行程序
		Centroller.run(list);
	}
}
