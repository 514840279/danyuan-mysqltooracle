package tk.ainiyue.danyuan.file;

import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.db.FileFlagChange;
import tk.ainiyue.danyuan.file.csv.CsvFileHandle;
import tk.ainiyue.danyuan.file.excle.ExcelFileHandle;
import tk.ainiyue.danyuan.file.txt.TXTFileHandle;
import tk.ainiyue.danyuan.po.SysFilesInfo;

/**    
*  文件名 ： FileController.java  
*  包    名 ： tk.ainiyue.danyuan.file  
*  描    述 ： 文件执行控制器  
*  机能名称：
*  技能ID ：
*  作    者 ： Administrator  
*  时    间 ： 2016年7月7日 上午9:44:36  
*  版    本 ： V1.0    
*/
public class FileController {

	/**
	 * 
	*  方法名： runController  
	*  功    能： 任务分配
	*  参    数： @param sysFilesInfo 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws
	 */
	public void runController(SysFilesInfo sysFilesInfo) {
		String type = sysFilesInfo.getType().toLowerCase().trim();
		// 如果文件大小超过 5M 的 进入 数据修改提示 “ 文件过大 建议使用 sql loder 方式 读取文件 写入数据库 ”
		if(sysFilesInfo.getByttery()<1242880
				
				||"mdb".equals(type)
				||"rar".equals(type)
				||"zip".equals(type)
				||"doc".equals(type)
				||"sql".equals(type)
				||"dbf".equals(type)
				){
			// 文件类型判断验证
			FileFlagChange change = new FileFlagChange();
			if ("txt".equals(type) && Constant.strlist.contains("txt")) {
				TXTFileHandle txt = new TXTFileHandle();
				txt.runTXTHandle(sysFilesInfo);
			} else if (("xlsx".equals(type) && Constant.strlist.contains("xlsx")) 
					|| ("xls".equals(type) && Constant.strlist.contains("xls"))
					|| "slk".equals(type)) {
				ExcelFileHandle txt = new ExcelFileHandle();
				txt.runExcelHandle(sysFilesInfo);
			} else if ("csv".equals(type) && Constant.strlist.contains("csv")) {
				CsvFileHandle csv = new CsvFileHandle();
				csv.runCSVHandle(sysFilesInfo);
			} else if ("mdb".equals(type) && Constant.strlist.contains("mdb")
					||"accdb".equals(type)) {
				sysFilesInfo.setFlag("10");
				change.changeFlag(sysFilesInfo);
			} else if (("rar".equals(type) && Constant.strlist.contains("rar")) || ("zip".equals(type) && Constant.strlist.contains("zip"))) {
				sysFilesInfo.setFlag("11");
				change.changeFlag(sysFilesInfo);
			} else if ("doc".equals(type) && Constant.strlist.contains("doc")) {
				sysFilesInfo.setFlag("12");
				change.changeFlag(sysFilesInfo);
			} else if ("sql".equals(type)) {
				sysFilesInfo.setFlag("13");
				change.changeFlag(sysFilesInfo);
			} else if ("dbf".equals(type)
					||"dbc".equals(type)||"dct".equals(type)
					||"dcx".equals(type)||"pjt".equals(type)
					||"pjx".equals(type)||"jpr".equals(type)
					||"cdx".equals(type)) {
				sysFilesInfo.setFlag("14");
				change.changeFlag(sysFilesInfo);
			} else if ("jpg".equals(type)||"bmp".equals(type)
					||"tiff".equals(type)||"jpeg".equals(type)
					||"png".equals(type)||"gif".equals(type)
					||"tif".equals(type)||"gif".equals(type)
					) {
				sysFilesInfo.setFlag("96");
				change.changeFlag(sysFilesInfo);
			} else if ("htm".equals(type)||"html".equals(type)
					||"css".equals(type)||"js".equals(type)
					||"mp3".equals(type)) {
				sysFilesInfo.setFlag("97");
				change.changeFlag(sysFilesInfo);
			} else if ("bat".equals(type)) {
				sysFilesInfo.setFlag("98");
				change.changeFlag(sysFilesInfo);
			} else {
				sysFilesInfo.setFlag("100");
				change.changeFlag(sysFilesInfo);
			}

		}else if(sysFilesInfo.getByttery()<1073741823){
			DBHandle handle = new DBHandle();
			sysFilesInfo.setFlag("1");
			sysFilesInfo.setErrormessage("文件过大 超过5M 建议使用 kettlet 方式 读取文件 写入数据库");
			handle.updateFileinfo(sysFilesInfo);
			// 打印消息
			System.out.println(sysFilesInfo.toString());
		}else{
			DBHandle handle = new DBHandle();
			sysFilesInfo.setFlag("1");
			sysFilesInfo.setErrormessage("文件过大 超过1G 建议使用 sqllodder 方式 读取文件 写入数据库");
			handle.updateFileinfo(sysFilesInfo);
			// 打印消息
			System.out.println(sysFilesInfo.toString());
		}
		type=null;
		System.gc();
	}
}
