package tk.ainiyue.danyuan.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**    
*  文件名 ： SysFilesTitle.java  
*  包    名 ： tk.ainiyue.danyuan.po  
*  描    述 ： 表信息 
*  机能名称：表信息
*  技能ID ：表信息
*  作    者 ： Administrator  
*  时    间 ： 2016年7月6日 上午11:06:41  
*  版    本 ： V1.0    
*/
@Entity
@Table(name = "sys_files_title")
public class SysFilesTitle {

	// 唯一约束建 uuid varchar（32）
	@Id
	@Column(name = "uuid", length = 32)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid") // 注解于属性中
	public String uuid;
	// 文件id file_id varchar（32）
	@Column(name = "file_id", length = 32)
	public String fileId;
	// 文件标题列 title varchar（30）
	@Column(name = "title", length = 30)
	public String title;
	// 是否是第一行 first_row varchar（2）
	@Column(name = "first_row", length = 2)
	public String firstRow;
	// 导入表名称 to_table varchar（30）
	@Column(name = "to_table", length = 30)
	public String toTable;
	// 导入表字段 to_column varchar（30）
	@Column(name = "to_column", length = 30)
	public String toColumn;
	// 导入表的列长度 to_col_length int
	@Column(name = "to_col_length")
	public int toColLength;
	// 导入表的列类型 to_col_type varchar(10)
	@Column(name = "to_col_type", length = 10)
	public String toColType;
	// 创建修改状态 create_flag varchar（2）
	@Column(name = "create_flag", length = 2)
	public String createFlag;

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
	 *  方法名 ： getFileId 
	 *  功    能 ： 返回变量 fileId 的值  
	 *  @return: String 
	 */
	public String getFileId() {
		return fileId;
	}

	/**  
	 *  方法名 ： setFileId 
	 *  功    能 ： 设置变量 fileId 的值
	 */
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	/**  
	 *  方法名 ： getTitle 
	 *  功    能 ： 返回变量 title 的值  
	 *  @return: String 
	 */
	public String getTitle() {
		return title;
	}

	/**  
	 *  方法名 ： setTitle 
	 *  功    能 ： 设置变量 title 的值
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**  
	 *  方法名 ： getFirstRow 
	 *  功    能 ： 返回变量 firstRow 的值  
	 *  @return: String 
	 */
	public String getFirstRow() {
		return firstRow;
	}

	/**  
	 *  方法名 ： setFirstRow 
	 *  功    能 ： 设置变量 firstRow 的值
	 */
	public void setFirstRow(String firstRow) {
		this.firstRow = firstRow;
	}

	/**  
	 *  方法名 ： getToTable 
	 *  功    能 ： 返回变量 toTable 的值  
	 *  @return: String 
	 */
	public String getToTable() {
		return toTable;
	}

	/**  
	 *  方法名 ： setToTable 
	 *  功    能 ： 设置变量 toTable 的值
	 */
	public void setToTable(String toTable) {
		this.toTable = toTable;
	}

	/**  
	 *  方法名 ： getToColumn 
	 *  功    能 ： 返回变量 toColumn 的值  
	 *  @return: String 
	 */
	public String getToColumn() {
		return toColumn;
	}

	/**  
	 *  方法名 ： setToColumn 
	 *  功    能 ： 设置变量 toColumn 的值
	 */
	public void setToColumn(String toColumn) {
		this.toColumn = toColumn;
	}

	/**  
	 *  方法名 ： getToColLength 
	 *  功    能 ： 返回变量 toColLength 的值  
	 *  @return: int 
	 */
	public int getToColLength() {
		return toColLength;
	}

	/**  
	 *  方法名 ： setToColLength 
	 *  功    能 ： 设置变量 toColLength 的值
	 */
	public void setToColLength(int toColLength) {
		this.toColLength = toColLength;
	}

	/**  
	 *  方法名 ： getToColType 
	 *  功    能 ： 返回变量 toColType 的值  
	 *  @return: String 
	 */
	public String getToColType() {
		return toColType;
	}

	/**  
	 *  方法名 ： setToColType 
	 *  功    能 ： 设置变量 toColType 的值
	 */
	public void setToColType(String toColType) {
		this.toColType = toColType;
	}

	/**  
	 *  方法名 ： getCreateFlag 
	 *  功    能 ： 返回变量 createFlag 的值  
	 *  @return: String 
	 */
	public String getCreateFlag() {
		return createFlag;
	}

	/**  
	 *  方法名 ： setCreateFlag 
	 *  功    能 ： 设置变量 createFlag 的值
	 */
	public void setCreateFlag(String createFlag) {
		this.createFlag = createFlag;
	}

}
