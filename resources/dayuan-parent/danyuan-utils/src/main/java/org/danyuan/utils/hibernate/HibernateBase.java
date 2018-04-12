package org.danyuan.utils.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**    
*  文件名 ： HibernateBase.java  
*  包    名 ： org.danyuan.utils.hibernate  
*  描    述 ： TODO(用一句话描述该文件做什么)  
*  作    者 ： Tenghui.Wang  
*  时    间 ： 2016年1月3日 下午10:55:20  
*  版    本 ： V1.0    
*/
public class HibernateBase {
	//	private static Connection conn = MySQLDBUtils.getConnection();
	
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	
	public HibernateBase(String pro) {
		Configuration configuration = new Configuration().configure(pro);
		sessionFactory = configuration.buildSessionFactory();
		
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
	}
	
	public void destroy() {
		transaction.commit();
		session.close();
		sessionFactory.close();
	}
	
	/**  
	 *  方法名 ： getSessionFactory 
	 *  功    能 ： 返回变量 sessionFactory 的值  
	 *  @return: SessionFactory 
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	/**  
	 *  方法名 ： setSessionFactory 
	 *  功    能 ： 设置变量 sessionFactory 的值
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**  
	 *  方法名 ： getSession 
	 *  功    能 ： 返回变量 session 的值  
	 *  @return: Session 
	 */
	public Session getSession() {
		return session;
	}
	
	/**  
	 *  方法名 ： setSession 
	 *  功    能 ： 设置变量 session 的值
	 */
	public void setSession(Session session) {
		this.session = session;
	}
	
	/**  
	 *  方法名 ： getTransaction 
	 *  功    能 ： 返回变量 transaction 的值  
	 *  @return: Transaction 
	 */
	public Transaction getTransaction() {
		return transaction;
	}
	
	/**  
	 *  方法名 ： setTransaction 
	 *  功    能 ： 设置变量 transaction 的值
	 */
	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}
	
}
