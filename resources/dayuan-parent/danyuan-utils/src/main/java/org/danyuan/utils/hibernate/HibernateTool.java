package org.danyuan.utils.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**    
*  文件名 ： HibernateTool.java  
*  包    名 ： org.danyuan.utils.hibernate  
*  描    述 ： TODO(用一句话描述该文件做什么)  
*  作    者 ： Tenghui.Wang  
*  时    间 ： 2016年1月3日 上午9:43:08  
*  版    本 ： V1.0    
*/
public class HibernateTool {
	private static SessionFactory sessionFactory;
	private static ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
	private static Session session;
	
	static {
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sessionFactory ini false");
		}
	}
	
	public static Session getSession() {
		session = threadLocal.get();
		if (session == null || !session.isOpen()) {
			session = sessionFactory.getCurrentSession();
		}
		threadLocal.set(session);
		return session;
	}
}