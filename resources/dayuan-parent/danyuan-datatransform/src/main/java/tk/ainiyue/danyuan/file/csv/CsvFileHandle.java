package tk.ainiyue.danyuan.file.csv;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.danyuan.utils.files.TxtFilesReader;

import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.db.FileFlagChange;
import tk.ainiyue.danyuan.file.DBHandle;
import tk.ainiyue.danyuan.po.SysFilesInfo;

/**
 * 文件名 ： CsvHandle.java
 * 包 名 ： tk.ainiyue.danyuan.file.csv
 * 描 述 ： csv 类型的文件处理类
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Tenghui.Wang
 * 时 间 ： 2016年7月7日 下午9:02:09
 * 版 本 ： V1.0
 */
public class CsvFileHandle {
	/**
	 * 方法名： runTXTHandle
	 * 功 能： 执行文件处理器
	 * 参 数： @param sysFilesInfo
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public void runCSVHandle(SysFilesInfo sysFilesInfo) {
		try {
			// 验证文件的类型
			File file = new File(sysFilesInfo.getFilePath());
			if (file.isFile()) {
				// 执行开始时间
				sysFilesInfo.setStartTimestimp(new Date());
				// 读入文件第一行
				String string = TxtFilesReader.readFileFirstLines(sysFilesInfo.getFilePath()).replace("\"", "").replace("'", "");
				// 分配 多少的字段
				int num = string.split(",").length;
				// 定界符
				sysFilesInfo.setSeparator(",");
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

}
