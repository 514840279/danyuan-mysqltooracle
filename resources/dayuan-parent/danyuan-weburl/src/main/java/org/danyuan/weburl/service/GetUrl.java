package org.danyuan.weburl.service;

import java.util.Date;

import org.danyuan.utils.dao.impl.HibernateDaoImpl;
import org.danyuan.weburl.Constant;
import org.danyuan.weburl.bean.WebUrl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * 文件名 ： GetUrl.java
 * 包 名 ： org.danyuan.weburl.service
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： wang
 * 时 间 ： 2016年10月7日 下午5:05:34
 * 版 本 ： V1.0
 */
public class GetUrl extends HibernateDaoImpl<WebUrl> {
	
	/**
	 * @throws Exception
	 * 方法名： getUrlFromHtmlBody
	 * 功 能： 提取所有的连接
	 * 参 数： @param body
	 * 返 回： void
	 * 作 者 ： wang
	 * @throws
	 */
	public static void getUrlFromHtmlBody(String body, WebUrl purl) throws Exception {
		try {
			Document doc = Jsoup.parse(body);
			Elements links = doc.select("a[href]");
			Elements media = doc.select("[src]");
			Elements imports = doc.select("link[href]");
			
			WebUrl url = null;
			for (Element src : media) {
				if (!"".equals(src.attr("abs:src").trim())) {
					url = new WebUrl();
					url.setTitle(src.attr("alt"));
					url.setUrl(src.attr("abs:src"));
					url.setType("media");
					validateUrl(url, purl.getUrl());
				}
			}
			
			for (Element link : imports) {
				if (!"".equals(link.attr("abs:href").trim())) {
					url = new WebUrl();
					url.setUrl(link.attr("abs:href"));
					url.setType("import");
					validateUrl(url, purl.getUrl());
				}
			}
			
			for (Element link : links) {
				if (!"".equals(link.attr("abs:href").trim())) {
					url = new WebUrl();
					url.setUrl(link.attr("abs:href"));
					url.setTitle(link.text());
					url.setType("links");
					validateUrl(url, purl.getUrl());
				}
			}
		} catch (Exception e) {
			HibernateDaoImpl<WebUrl> dao = new HibernateDaoImpl<WebUrl>();
			purl.setFlag("-1");
			purl.setUpdateTimestimp(new Date());
			dao.saveOrUpdate(purl, Constant._HIBERNATE_ORCL);
			throw new Exception("-1");
		}
	}
	
	/**
	 * 方法名： validateUrl
	 * 功 能： 验证数据并入库
	 * 参 数：
	 * 返 回： void
	 * 作 者 ： wang
	 * @throws
	 */
	public static void validateUrl(WebUrl url, String pUrl) {
		// 验证数据是否有这个数据
		HibernateDaoImpl<WebUrl> dao = new HibernateDaoImpl<WebUrl>();
		String hql = "From WebUrl where url = '" + url.getUrl() + "' ";
		WebUrl urla = dao.getUnionObject(hql, Constant._HIBERNATE_ORCL);
		// 没有就入库 有就返回
		if (urla == null) {
			url.setParrentUrl(pUrl);
			url.setFlag("0");
			url.setInsertTimestimp(new Date());
			url.setUpdateTimestimp(new Date());
			dao = new HibernateDaoImpl<WebUrl>();
			dao.save(url, Constant._HIBERNATE_ORCL);
		}
	}
}
