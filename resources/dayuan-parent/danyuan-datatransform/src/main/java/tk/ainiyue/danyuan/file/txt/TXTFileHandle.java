package tk.ainiyue.danyuan.file.txt;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.danyuan.utils.files.TxtFilesReader;

import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.db.FileFlagChange;
import tk.ainiyue.danyuan.file.DBHandle;
import tk.ainiyue.danyuan.po.SysFilesInfo;

/**
 * 文件名 ： TXTFileHandle.java
 * 包 名 ： tk.ainiyue.danyuan.file.txt
 * 描 述 ： 自动 录入 txt文件 到 数据库 中
 * 机能名称：自动 录入 txt文件 到 数据库 中
 * 技能ID ：自动 录入 txt文件 到 数据库 中
 * 作 者 ： Administrator
 * 时 间 ： 2016年7月7日 上午9:55:52
 * 版 本 ： V1.0
 */
public class TXTFileHandle {

	/**
	 * 方法名： runTXTHandle
	 * 功 能： 执行文件处理器
	 * 参 数： @param sysFilesInfo
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public void runTXTHandle(SysFilesInfo sysFilesInfo) {
		try {
			// 验证文件的类型
			File file = new File(sysFilesInfo.getFilePath());
			if (file.isFile()) {
				// 执行开始时间
				sysFilesInfo.setStartTimestimp(new Date());
				// 读入文件第一行
				String string = TxtFilesReader.readFileFirstLines(sysFilesInfo.getFilePath()).replace("\"", "").replace("'", "");
				// 分配 多少的字段
				int num = findcolum(sysFilesInfo, string);
				// 生成 表
				DBHandle hand = new DBHandle();
				hand.createtable(sysFilesInfo, num, false);
				// 读入文件
				List<String> list = TxtFilesReader.readFileByLines(sysFilesInfo.getFilePath());
				// 批量入库
				hand.insertIntoDB(sysFilesInfo, list);
				// 验证信息 入库是否正常
				hand.validateTables(sysFilesInfo);
			}
		} catch (Exception e) {
			sysFilesInfo.setFlag("-3");
			sysFilesInfo.setErrormessage(e.getMessage());
			FileFlagChange change = new FileFlagChange();
			// 更新 文件入库的信息
			change.saveOrUpdate(sysFilesInfo, Constant._HIBERNATE_ORCL);
		}
		System.gc();
	}

	/**
	 * 方法名： findcolum
	 * 功 能： 文件信息和第一行 信息判断出生成几个字段
	 * 参 数： @param sysFilesInfo
	 * 参 数： @param string
	 * 参 数： @return
	 * 返 回： int
	 * 作 者 ： Administrator
	 * @throws
	 */
	public int findcolum(SysFilesInfo sysFilesInfo, String string) {
		// 分割字符
		char[] cha = string.toCharArray();
		// 循环判断那种分割符最大
		// 变量 char
		char ctemp = '\u0000';
		// 变量 num
		int num = 1;
		// 对应 数组
		int numarray[] = { 0, 0, 0 };
		// 定界符
		char chaarray[] = { '\t', '`', ' ','	','	' };
		// 统计出现的 次数
		for (char c : cha) {
			for (int i = 0; i < chaarray.length; i++) {
				if (chaarray[i] == c) {
					numarray[i]++;
				}
			}
		}
		// 取最大的
		for (int i = 0; i < chaarray.length; i++) {
			if (num < numarray[i]) {
				num = numarray[i];
				ctemp = chaarray[i];
			}
		}
		// 定界符
		sysFilesInfo.setSeparator(Character.toString(ctemp));
		// 列数
		return num;

	}

}
