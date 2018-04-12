package org.danyuan.utils.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**    
*  文件名 ： HibernateUtils.java  
*  包    名 ： org.danyuan.utils.hibernate  
*  描    述 ： TODO(用一句话描述该文件做什么)  
*  作    者 ： Tenghui.Wang  
*  时    间 ： 2015年12月27日 上午8:30:33  
*  版    本 ： V1.0    
*/
public class HibernateUtils {
	
	/**  
	*  构造方法： 
	*  描    述： TODO(这里用一句话描述这个方法的作用)  
	*  参    数： 
	*  作    者 ： Tenghui.Wang  
	*  @throws  
	*/
	public HibernateUtils() {
		super();
	}
	
	private static HibernateUtils instance = new HibernateUtils();
	
	/**  
	 *  方法名 ： getInstance 
	 *  功    能 ： 返回变量 instance 的值  
	 *  @return: HibernateUtils 
	 */
	public static HibernateUtils getInstance() {
		return instance;
	}
	
	private SessionFactory sessionfactory;
	
	/**  
	 *  方法名 ： getSessionfactory 
	 *  功    能 ： 返回变量 sessionfactory 的值  
	 *  @return: SessionFactory 
	 */
	public SessionFactory getSessionfactory() {
		if (sessionfactory == null) {
			Configuration configuration = new Configuration().configure();
			sessionfactory = configuration.buildSessionFactory();
		}
		return sessionfactory;
	}
	
	/**
	 * 
	*  方法名： getSession   
	*  功    能：获取当前线程绑定的session
	*  参    数： @return 
	*  返    回： Session  
	*  作    者 ： Tenghui.Wang  
	*  @throws
	 */
	public Session getSession() {
		sessionfactory.openSession().beginTransaction();
		return getSessionfactory().getCurrentSession();
	}
}
