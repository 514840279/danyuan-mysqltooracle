package tk.ainiyue.danyuan.search;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.danyuan.utils.dao.impl.HibernateDaoImpl;
import org.danyuan.utils.files.TxtFilesReader;
import org.danyuan.utils.files.TxtFilesWriter;

import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.db.FileFlagChange;
import tk.ainiyue.danyuan.po.SysFilesInfo;

/**    
*  文件名 ： ReadFileList.java  
*  包    名 ： tk.ainiyue.danyuan.search  
*  描    述 ： 读取指定的路径下的文件信息 并保存入到表中
*  机能名称：读取指定的路径下的文件信息 并保存入到表中
*  技能ID ：读取指定的路径下的文件信息 并保存入到表中
*  作    者 ： Administrator  
*  时    间 ： 2016年7月6日 上午11:18:32  
*  版    本 ： V1.0    
*/
public class ReadFileList extends HibernateDaoImpl<SysFilesInfo> {

	/**
	 * 
	*  方法名： runsearch  
	*  功    能：读取指定的路径下的文件信息 并保存入到表中
	*  参    数：  
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws
	 */
	public void runsearch() {
		// 变量 
		boolean flag = true;
		FileFlagChange change = new FileFlagChange();
		// 配置文件的路径
		String path = System.getProperty("user.dir") + Constant._DATA_FILE_LIST_NAME;
		// 配置文件内的文件路径列表
		List<String> strlist = TxtFilesReader.readFileByLines(path);
		// 文件列表没有的话 从数据库中读取
		if(strlist==null||strlist.size()==0){
			// 从数据库中读取文件的地址 
			strlist = change.readFileByDirFromDB();
			flag = false;
		}
		// 如果有数据写入数据库
		while(strlist!=null&&strlist.size()>0){
			// 遍历路径
			for (String string : strlist) {
				// 这个任务 信息
				//			File file = new File(string);
							// 验证路径是 文件夹的执行
				//			if (file.isDirectory()) {
				//				// 获取 文件 的 列表
				//				File[] files = file.listFiles();
				//				// 要访问的路径 记录 写入 数据库 快些 
				//				writeDirToDB(files);
				//			}
				if(flag){
					// 干掉这条任务
					deleteDirFromFile(string);
				}
				// 读取文件列表
				readFileList(string);
			}
			// 从数据库中读取文件的地址 
			strlist = change.readFileByDirFromDB();
		}
		
		
	}

	/**
	 * 
	*  方法名： readFileList  
	*  功    能： 读取指定路径下的文件列表
	*  参    数： @param path 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws
	 */
	public void readFileList(String path) {
		// 这个任务 信息
		File file = new File(path);
		// 验证路径是 文件夹的执行
		if (file.isDirectory()) {
			// 获取 文件 的 列表
			File[] files = file.listFiles();
			// 要访问的路径 记录 写入 数据库 快些 
			// writeDirToFile(files);
			writeDirToDB(files);
			// 遍历 路径 获取信息
//			for (File filer : files) {
//				// 如果是文件 就读取文件信息 并且不是 回收站的文件
//				if (filer.isFile() && !filer.getAbsolutePath().contains("$RECYCLE.BIN")) {
//					FileFlagChange change = new FileFlagChange();
//					// 验证 数据 库 中 是否 有这个 东西
//					boolean flag = change.findFile(filer.getAbsolutePath());
//					if (flag) {
//						// 
//						System.out.println("读取 文件 信息：" + filer.getAbsolutePath());
//						// 读取 文件 信息
//						readFileInfo(filer);
//					}
//				} else if (filer.isHidden()) {
//					System.out.println("跳过隐藏 文件 信息：" + filer.getAbsolutePath());
//					// 读取 文件 信息
//				} else {
//					System.out.println("进入路径：" + filer.getAbsolutePath());
//					// 如果是路径 就进入读取
//					readFileList(filer.getAbsolutePath());
//				}
//
//			}
			// 删除文件任务
			// deleteDirFromFile(filer.getAbsolutePath());
		}
		// 删掉文件路径
		deleteDIRFromDB(file);
	}

	/**  
	*  方法名： deleteDIRFromDB  
	*  功    能： 删数据
	*  参    数： @param filer 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	private void deleteDIRFromDB(File filer) {
		String hql = " delete  from SysFilesInfo where filePath = '"+filer.getAbsolutePath()+"'"; 
		FileFlagChange change = new FileFlagChange();
		change.deleteByPath(hql);
		
	}

	/**  
	*  方法名： writeDirToDB  
	*  功    能： 写入数据库中文件夹中的文件信息  
	*  参    数： @param files 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	private void writeDirToDB(File[] files) {
		FileFlagChange change =new FileFlagChange();
		// 不断写入数据库 
		 for(File file : files) {
			 // 如果文件不是隐藏文件 并且 文件在数据库中没有
			if( !file.isHidden()&& change.findFile(file.getAbsolutePath())){
				// 读取文件信息 写入 数据库 
				readFileInfo( file);
			}
		}
		
	}

	/**  
	*  方法名： deleteDirFromFile  
	*  功    能： 已经读完的 信息 移除 任务  
	*  参    数： @param absolutePath 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	private void deleteDirFromFile(String absolutePath) {
		// 获取 文件 任务列表 信息
		List<String> list = TxtFilesReader.readFileByLines(System.getProperty("user.dir") + Constant._DATA_FILE_LIST_NAME);
		// 如果 有这个文件 就删除
		if (list.contains(absolutePath)) {
			// 删除 路径信息
			list.remove(absolutePath);
			String temp ="";
			// 遍历 写入
			for (int i = 0; i < list.size(); i++) {
				temp+= "\r\n"+list.get(i);
			}
		// 写入文件 中
			TxtFilesWriter.writeToFile(temp, System.getProperty("user.dir") + Constant._DATA_FILE_LIST_NAME);
		}
	}

	/**  
	*  方法名： writeDirToFile  
	*  功    能： 写入 任务 
	*  参    数： @param files 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws  
	*/
//	private void writeDirToFile(File[] files) {
//		// 遍历 写入
//		for (File file : files) {
//			// 如果是路径
//			if (file.isDirectory()&&!file.isHidden()) {
//				// 写入文件 中
//				TxtFilesWriter.appendWriteToFile(file.getAbsolutePath(), System.getProperty("user.dir") + Constant._DATA_FILE_LIST_NAME);
//			}
//		}
//	}



	/**
	 * 
	*  方法名： readFileInfo  
	*  功    能： 读取指定位置的文件的 信息
	*  参    数： @param file 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws
	 */
	public void readFileInfo(File file) {

		// 文件 是存在的
		if (file.exists()) {
			// 实例化 新对象
			SysFilesInfo info = new SysFilesInfo();
			// 获取文件的信息
			// info.setUuid(UUID.randomUUID().toString()); // uuid
			String fileName = file.getName();
			info.setFileName(fileName); // 文件名
			String prefix = fileName.substring(fileName.lastIndexOf(".") + 1);
			info.setType(prefix); // 文件扩展名 
			info.setByttery(file.length()); // 文件大小
			info.setFilePath(file.getAbsolutePath()); // 文件路径
			info.setFlag("0"); // 处理标识符 默认是0
			info.setStartTimestimp(new Date());
			//  是否文件夹 
			if(file.isDirectory()){
				info.setIsDir("1"); 
			}
			// 文件 大小 为0 的 写入 废弃 
			if(file.length()==0){
				info.setFlag("-100");
				info.setErrormessage("空的文件");
			}
			// 写入数据库中
			writeFileInfoToDB(info);
		}

	}

	/**
	 * 
	*  方法名： writeFileInfoToDB  
	*  功    能： 将获取的文件信息写入到数据库中
	*  参    数： @param info 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws
	 */
	public void writeFileInfoToDB(SysFilesInfo info) {
		// 写入数据库
		ReadFileList dao = new ReadFileList();
		dao.saveOrUpdate(info, Constant._HIBERNATE_ORCL);
	}

}
