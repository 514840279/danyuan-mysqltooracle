package tk.ainiyue.danyuan.po;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**    
*  文件名 ： SysTransformInfo.java  
*  包    名 ： tk.ainiyue.danyuan.po  
*  描    述 ： 文件信息
*  机能名称：文件信息
*  技能ID ：文件信息
*  作    者 ： Administrator  
*  时    间 ： 2016年7月6日 上午11:08:56  
*  版    本 ： V1.0    
*/
@Entity
@Table(name = "sys_files_title")
public class SysTransformInfo {
	// 唯一主键 uuid varchar（32）
	@Id
	@Column(name = "uuid", length = 32)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid") // 注解于属性中
	public String uuid;
	// 拥有者 owner varchar（100）
	@Column(name = "owner", length = 100)
	public String owner;
	// 表名(注释)或文件名 table_id varchar（50）
	@Column(name = "table_id", length = 50)
	public String tableId;
	// 插入库中数据量 succeed_num int
	@Column(name = "succeed_num")
	public long succeedNum;
	// 错误的数据量 error_num varchar（2047）
	@Column(name = "error_num", length = 2048)
	public long errorNum;
	// 录入数据库采集的日期 date date
	@Column(name = "datet")
	public Date date;
	// 任务执行的时间 insert_timestimp timestamp
	@Column(name = "insert_timestimp")
	public Date insertTimestimp;

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
	 *  方法名 ： getOwner 
	 *  功    能 ： 返回变量 owner 的值  
	 *  @return: String 
	 */
	public String getOwner() {
		return owner;
	}

	/**  
	 *  方法名 ： setOwner 
	 *  功    能 ： 设置变量 owner 的值
	 */
	public void setOwner(String owner) {
		this.owner = owner;
	}

	/**  
	 *  方法名 ： getTableId 
	 *  功    能 ： 返回变量 tableId 的值  
	 *  @return: String 
	 */
	public String getTableId() {
		return tableId;
	}

	/**  
	 *  方法名 ： setTableId 
	 *  功    能 ： 设置变量 tableId 的值
	 */
	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	/**  
	 *  方法名 ： getSucceedNum 
	 *  功    能 ： 返回变量 succeedNum 的值  
	 *  @return: long 
	 */
	public long getSucceedNum() {
		return succeedNum;
	}

	/**  
	 *  方法名 ： setSucceedNum 
	 *  功    能 ： 设置变量 succeedNum 的值
	 */
	public void setSucceedNum(long succeedNum) {
		this.succeedNum = succeedNum;
	}

	/**  
	 *  方法名 ： getErrorNum 
	 *  功    能 ： 返回变量 errorNum 的值  
	 *  @return: long 
	 */
	public long getErrorNum() {
		return errorNum;
	}

	/**  
	 *  方法名 ： setErrorNum 
	 *  功    能 ： 设置变量 errorNum 的值
	 */
	public void setErrorNum(long errorNum) {
		this.errorNum = errorNum;
	}

	/**  
	 *  方法名 ： getDate 
	 *  功    能 ： 返回变量 date 的值  
	 *  @return: Date 
	 */
	public Date getDate() {
		return date;
	}

	/**  
	 *  方法名 ： setDate 
	 *  功    能 ： 设置变量 date 的值
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**  
	 *  方法名 ： getInsertTimestimp 
	 *  功    能 ： 返回变量 insertTimestimp 的值  
	 *  @return: Date 
	 */
	public Date getInsertTimestimp() {
		return insertTimestimp;
	}

	/**  
	 *  方法名 ： setInsertTimestimp 
	 *  功    能 ： 设置变量 insertTimestimp 的值
	 */
	public void setInsertTimestimp(Date insertTimestimp) {
		this.insertTimestimp = insertTimestimp;
	}

}
