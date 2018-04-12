package tk.ainiyue.danyuan.file.excle;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.danyuan.utils.excel.ImportExeclMain;

import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.db.FileFlagChange;
import tk.ainiyue.danyuan.file.DBHandle;
import tk.ainiyue.danyuan.po.SysFilesInfo;

/**
 * 文件名 ： XLSFileHandle.java
 * 包 名 ： tk.ainiyue.danyuan.file.xls
 * 描 述 ： excel文件 入库 操作
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Tenghui.Wang
 * 时 间 ： 2016年7月7日 下午9:20:06
 * 版 本 ： V1.0
 */
public class ExcelFileHandle {
	/**
	* 方法名： runTXTHandle
	* 功 能： 执行文件处理器
	* 参 数： @param sysFilesInfoDB(files);
	* 返 回： void
	* 作 者 ： Administrator
	* @throws
	*/
	public void runExcelHandle(SysFilesInfo sysFilesInfo) {
		// 验证文件的类型
		File file = new File(sysFilesInfo.getFilePath());
		if (file.isFile()) {
			// 执行开始时间
			sysFilesInfo.setStartTimestimp(new Date());
			// 读入文件第一行
			ImportExeclMain poi = new ImportExeclMain();
			List<List<List<String>>> list = null;
			try {
				// 读取文件所有的 sheet行 Colum
				list = poi.readExcel(sysFilesInfo.getFilePath());
				DBHandle hand = new DBHandle();
				// 变量
				int i = 0;
				for (List<List<String>> list2 : list) {
					if (list2 != null && list2.size() > 0) {
						i++;
						// 分配 多少的字段
						int sizenum = list2.size();
						int num = list2.get(sizenum - 1).size() > 1 ? list2.get(sizenum - 1).size() : list2.get(0).size();
						// excel sheet 大于 1的时候 生成 新的表
						if (i > 1) {
							// 生成 表
							hand.createtable(sysFilesInfo, num, true);
							for (List<String> list3 : list2) {
								// 批量入库
								hand.excelinsertIntoDB(sysFilesInfo, list3);
							}
							// 插入 新的 记录
							sysFilesInfo.setUuid(null);
							sysFilesInfo.setRowCount(list2.size());
						} else {
							// 生成 表
							hand.createtable(sysFilesInfo, num, false);
							for (List<String> list3 : list2) {
								// 批量入库
								hand.excelinsertIntoDB(sysFilesInfo, list3);
							}
							sysFilesInfo.setRowCount(list2.size());
						}
					}
					// 设置表 sheet 顺序
					sysFilesInfo.setExcelSheetName(i+"");
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
		}
		System.gc();
	}
}
