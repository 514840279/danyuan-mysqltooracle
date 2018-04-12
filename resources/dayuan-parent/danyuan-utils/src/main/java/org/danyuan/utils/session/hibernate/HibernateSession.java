package org.danyuan.utils.session.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**    
 *  文件名 ： HibernateSession.java  
 *  包    名 ： org.eastone.utils.session.hibernate  
 *  描    述 ： TODO(用一句话描述该文件做什么)  
 *  作    者 ： Tenghui.Wang  
 *  时    间 ： 2015年12月14日 下午5:15:55  
 *  版    本 ： V1.0    
 */
public class HibernateSession {
	protected static SessionFactory sessionFactory;
	protected static Session session;
	protected static Transaction transaction;
	
	public HibernateSession() {
		Configuration configuration = new Configuration().configure();
		sessionFactory = configuration.buildSessionFactory();
		
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
	}
	
	public HibernateSession(String path) {
		Configuration configuration = new Configuration().configure(path);
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
		HibernateSession.sessionFactory = sessionFactory;
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
		HibernateSession.session = session;
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
		HibernateSession.transaction = transaction;
	}
	
}
