package org.danyuan.weburl.controll;

import java.util.Date;
import java.util.List;

import org.danyuan.utils.dao.impl.HibernateDaoImpl;
import org.danyuan.weburl.Constant;
import org.danyuan.weburl.bean.WebUrl;
import org.danyuan.weburl.service.GetUrl;
import org.danyuan.weburl.service.WebInfo;

/**
 * 文件名 ： Centroller.java 包 名 ： tk.ainiyue.danyuan.controller 描 述 ：
 * TODO(用一句话描述该文件做什么) 机能名称： 技能ID ： 作 者 ： Administrator 时 间 ： 2016年7月6日
 * 上午10:58:16 版 本 ： V1.0
 */
public class Centroller extends HibernateDaoImpl<WebUrl> {

	/**
	 * 方法名： run 功 能： 运行 参 数： 返 回： void 作 者 ： Administrator @throws
	 */
	public static void run(List<WebUrl> strlist) {
		// 验证文件是否为空
		while (strlist != null) {
			while (!strlist.isEmpty()) {
				// 获取网页
				String webInfo = WebInfo.getWebInfoByHttpURLConnection(strlist.get(0).getUrl());
				// System.out.println(webInfo);
				// 获取连接 验证连接
				try {
					GetUrl.getUrlFromHtmlBody(webInfo, strlist.get(0));
					strlist.get(0).setFlag("1");
					// 修改连接状态
					modifyFlag(strlist.get(0));

				} catch (Exception e) {
				}
				// 入库
				strlist.remove(strlist.get(0));

			}
			System.gc();
			HibernateDaoImpl<WebUrl> dao = new HibernateDaoImpl<WebUrl>();
			String hql = "From WebUrl where flag = '0' and type  NOT IN ( 'media' ,'import') AND url LIKE 'http://www.xuexi111.com%'  order by update_timestimp  ";
			int[] i = { 0, 1 };
			strlist = dao.getObject(hql, Constant._HIBERNATE_ORCL, i);

		}
	}

	/**
	 * 方法名： modifyFlag 功 能： TODO(这里用一句话描述这个方法的作用) 参 数： @param url 返 回： void 作 者
	 * ： wang @throws
	 */
	public static void modifyFlag(WebUrl url) {
		HibernateDaoImpl<WebUrl> dao = new HibernateDaoImpl<WebUrl>();

		url.setUpdateTimestimp(new Date());
		url.setInsertTimestimp(new Date());
		dao.saveOrUpdate(url, Constant._HIBERNATE_ORCL);

	}

}
