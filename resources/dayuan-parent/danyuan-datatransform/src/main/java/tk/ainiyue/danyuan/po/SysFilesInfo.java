package tk.ainiyue.danyuan.po;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**    
*  文件名 ： SysFilesInfo.java  
*  包    名 ： tk.ainiyue.danyuan.po  
*  描    述 ：文件信息
*  机能名称：文件信息
*  技能ID ：文件信息
*  作    者 ： Administrator  
*  时    间 ： 2016年7月6日 上午11:00:05  
*  版    本 ： V1.0    
*/
@Entity
@Table(name = "sys_files_info")
public class SysFilesInfo {
	// 唯一主键 uuid varchar（32）
	@Id
	@Column(name = "uuid", length = 32)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid") // 注解于属性中
	private String uuid;
	// 文件名 file_name varchar（100）
	@Column(name = "file_name", length = 100, nullable = true)
	private String fileName;
	// 文件类型 type varchar（50）
	@Column(name = "type", length = 50, nullable = true)
	private String type;
	// 文件大小 byte int
	@Column(name = "byttery", nullable = true)
	private long byttery;
	// 文件绝对路径 file_path varchar（2047）
	@Column(name = "file_path", nullable = true)
	private String filePath;
	// excerl 多个sheet 时 取得 sheet名称
	@Column(name = "excel_sheet_name")
	private String excelSheetName;
	// 定界符 separator varchar（10）
	@Column(name = "separator")
	private String separator;
	// 替换符号 optionally varchar（10）
	@Column(name = "optionally")
	private String optionally;
	// 插入开始时间 start_timestimp timestamp
	@Column(name = "start_timestimp")
	private Date startTimestimp;
	// 插入状态 flag varchar（10）
	@Column(name = "flag")
	private String flag;
	// 插入记录数 inser_num int
	@Column(name = "inser_num")
	private long inserNum;
	// 插入结束时间 end_eimestimp timestamp
	@Column(name = "end_eimestimp")
	private Date endEimestimp;
	// 插入数据库 database_id varchar（30）
	@Column(name = "database_id")
	private String databaseId;
	// 插入数据库的表名称 to_database_table_name varchar（30）
	@Column(name = "to_database_table_name")
	private String toDatabaseTableName;
	// 插入数据库的数据量 row_count int
	@Column(name = "row_count")
	private long rowCount=0;
	// 执行的错误信息
	@Column(name = "error_message",length=4000)
	private String errormessage;
	// 是否 文件夹 
	@Column(name = "is_dir",length=4)
	private String isDir;
	
	
	

	/**  
	 *  方法名 ： getUuid 
	 *  功    能 ： 返回变量 uuid 的值  
	 *  @return: String 
	 */
	public String getUuid() {
		return uuid;
	}

	/**  
	 *  方法名 ： setUuid 
	 *  功    能 ： 设置变量 uuid 的值
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	/**  
	 *  方法名 ： getFileName 
	 *  功    能 ： 返回变量 fileName 的值  
	 *  @return: String 
	 */
	public String getFileName() {
		return fileName;
	}

	/**  
	 *  方法名 ： setFileName 
	 *  功    能 ： 设置变量 fileName 的值
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**  
	 *  方法名 ： getType 
	 *  功    能 ： 返回变量 type 的值  
	 *  @return: String 
	 */
	public String getType() {
		return type;
	}

	/**  
	 *  方法名 ： setType 
	 *  功    能 ： 设置变量 type 的值
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**  
	 *  方法名 ： getByttery 
	 *  功    能 ： 返回变量 byttery 的值  
	 *  @return: long 
	 */
	public long getByttery() {
		return byttery;
	}

	/**  
	 *  方法名 ： setByttery 
	 *  功    能 ： 设置变量 byttery 的值
	 */
	public void setByttery(long byttery) {
		this.byttery = byttery;
	}

	/**  
	 *  方法名 ： getFilePath 
	 *  功    能 ： 返回变量 filePath 的值  
	 *  @return: String 
	 */
	public String getFilePath() {
		return filePath;
	}

	/**  
	 *  方法名 ： setFilePath 
	 *  功    能 ： 设置变量 filePath 的值
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	/**  
	 *  方法名 ： getSeparator 
	 *  功    能 ： 返回变量 separator 的值  
	 *  @return: String 
	 */
	public String getSeparator() {
		return separator;
	}

	/**  
	 *  方法名 ： setSeparator 
	 *  功    能 ： 设置变量 separator 的值
	 */
	public void setSeparator(String separator) {
		this.separator = separator;
	}

	/**  
	 *  方法名 ： getOptionally 
	 *  功    能 ： 返回变量 optionally 的值  
	 *  @return: String 
	 */
	public String getOptionally() {
		return optionally;
	}

	/**  
	 *  方法名 ： setOptionally 
	 *  功    能 ： 设置变量 optionally 的值
	 */
	public void setOptionally(String optionally) {
		this.optionally = optionally;
	}

	/**  
	 *  方法名 ： getStartTimestimp 
	 *  功    能 ： 返回变量 startTimestimp 的值  
	 *  @return: Date 
	 */
	public Date getStartTimestimp() {
		return startTimestimp;
	}

	/**  
	 *  方法名 ： setStartTimestimp 
	 *  功    能 ： 设置变量 startTimestimp 的值
	 */
	public void setStartTimestimp(Date startTimestimp) {
		this.startTimestimp = startTimestimp;
	}

	/**  
	 *  方法名 ： getFlag 
	 *  功    能 ： 返回变量 flag 的值  
	 *  @return: String 
	 */
	public String getFlag() {
		return flag;
	}

	/**  
	 *  方法名 ： setFlag 
	 *  功    能 ： 设置变量 flag 的值
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**  
	 *  方法名 ： getInserNum 
	 *  功    能 ： 返回变量 inserNum 的值  
	 *  @return: long 
	 */
	public long getInserNum() {
		return inserNum;
	}

	/**  
	 *  方法名 ： setInserNum 
	 *  功    能 ： 设置变量 inserNum 的值
	 */
	public void setInserNum(long inserNum) {
		this.inserNum = inserNum;
	}

	/**  
	 *  方法名 ： getEndEimestimp 
	 *  功    能 ： 返回变量 endEimestimp 的值  
	 *  @return: Date 
	 */
	public Date getEndEimestimp() {
		return endEimestimp;
	}

	/**  
	 *  方法名 ： setEndEimestimp 
	 *  功    能 ： 设置变量 endEimestimp 的值
	 */
	public void setEndEimestimp(Date endEimestimp) {
		this.endEimestimp = endEimestimp;
	}

	/**  
	 *  方法名 ： getDatabaseId 
	 *  功    能 ： 返回变量 databaseId 的值  
	 *  @return: String 
	 */
	public String getDatabaseId() {
		return databaseId;
	}

	/**  
	 *  方法名 ： setDatabaseId 
	 *  功    能 ： 设置变量 databaseId 的值
	 */
	public void setDatabaseId(String databaseId) {
		this.databaseId = databaseId;
	}

	/**  
	 *  方法名 ： getToDatabaseTableName 
	 *  功    能 ： 返回变量 toDatabaseTableName 的值  
	 *  @return: String 
	 */
	public String getToDatabaseTableName() {
		return toDatabaseTableName;
	}

	/**  
	 *  方法名 ： setToDatabaseTableName 
	 *  功    能 ： 设置变量 toDatabaseTableName 的值
	 */
	public void setToDatabaseTableName(String toDatabaseTableName) {
		this.toDatabaseTableName = toDatabaseTableName;
	}

	/**  
	 *  方法名 ： getRowCount 
	 *  功    能 ： 返回变量 rowCount 的值  
	 *  @return: long 
	 */
	public long getRowCount() {
		return rowCount;
	}

	/**  
	 *  方法名 ： setRowCount 
	 *  功    能 ： 设置变量 rowCount 的值
	 */
	public void setRowCount(long rowCount) {
		this.rowCount = rowCount;
	}

	/**  
	 *  方法名 ： getErrormessage 
	 *  功    能 ： 返回变量 errormessage 的值  
	 *  @return: String 
	 */
	public String getErrormessage() {
		return errormessage;
	}

	/**  
	 *  方法名 ： setErrormessage 
	 *  功    能 ： 设置变量 errormessage 的值
	 */
	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}

	/**  
	 *  方法名 ： getIsDir 
	 *  功    能 ： 返回变量 isDir 的值  
	 *  @return: String 
	 */
	public String getIsDir() {
		return isDir;
	}

	/**  
	 *  方法名 ： setIsDir 
	 *  功    能 ： 设置变量 isDir 的值
	 */
	public void setIsDir(String isDir) {
		this.isDir = isDir;
	}

	
	/**  
	 *  方法名 ： getExcelSheetName 
	 *  功    能 ： 返回变量 excelSheetName 的值  
	 *  @return: String 
	 */
	public String getExcelSheetName() {
		return excelSheetName;
	}

	/**  
	 *  方法名 ： setExcelSheetName 
	 *  功    能 ： 设置变量 excelSheetName 的值
	 */
	public void setExcelSheetName(String excelSheetName) {
		this.excelSheetName = excelSheetName;
	}

	/** 
	*  方法名 ： toString
	*  功    能 ： TODO(这里用一句话描述这个方法的作用)  
	*  参    数 ： @return  
	*  参    考 ： @see java.lang.Object#toString()  
	*  作    者 ： Administrator  
	*/
	
	@Override
	public String toString() {
		return "SysFilesInfo [uuid=" + uuid + ", fileName=" + fileName + ", type=" + type + ", byttery=" + byttery + ", filePath=" + filePath + ", excelSheetName=" + excelSheetName + ", separator=" + separator + ", optionally=" + optionally + ", startTimestimp=" + startTimestimp + ", flag=" + flag + ", inserNum=" + inserNum + ", endEimestimp=" + endEimestimp + ", databaseId=" + databaseId + ", toDatabaseTableName=" + toDatabaseTableName + ", rowCount=" + rowCount + ", errormessage=" + errormessage + ", isDir=" + isDir + "]";
	}

	
}
