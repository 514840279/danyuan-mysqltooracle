package tk.ainiyue.danyuan;

import java.util.List;

import org.danyuan.utils.files.TxtFilesReader;

public class Constant {

	// 指定要提取数据的路径列表文件
	// 每行一个地址
	public static final String _DATA_FILE_LIST_NAME = "/data_file_list.txt";
	// 控制文件
	public static final String _CONTROLL_NAME = "/controller.txt";
	// hibernate 的配置文件路径
	public static final String _HIBERNATE_ORCL = "hibernate.cfg.xml";
	// 配置文件的路径
	static String path = System.getProperty("user.dir") + Constant._CONTROLL_NAME;
	// 配置文件内的文件路径列表
	public static List<String> strlist = TxtFilesReader.readFileByLines(path);
}
