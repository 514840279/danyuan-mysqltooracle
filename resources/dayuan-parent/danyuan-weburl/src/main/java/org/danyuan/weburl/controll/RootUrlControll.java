package org.danyuan.weburl.controll;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialException;

import org.danyuan.utils.dao.impl.HibernateDaoImpl;
import org.danyuan.weburl.Constant;
import org.danyuan.weburl.bean.RootUrl;
import org.danyuan.weburl.service.WebInfo;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.alibaba.fastjson.JSON;

/**
 * 文件名 ： RootUrlControll.java
 * 包 名 ： org.danyuan.weburl.controll
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： wang
 * 时 间 ： 2016年10月12日 下午8:00:07
 * 版 本 ： V1.0
 */
public class RootUrlControll extends HibernateDaoImpl<RootUrl> {
	
	/**
	 * 方法名： managerRootUrlIndex
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param strlist
	 * 返 回： void
	 * 作 者 ： wang
	 * @throws
	 */
	public static void managerRootUrlIndex(List<String> strlist) {
		for (String string : strlist) {
			HibernateDaoImpl<RootUrl> dao = new HibernateDaoImpl<RootUrl>();
			String hql = "From RootUrl where url ='" + string + "'";
			RootUrl url = dao.getUnionObject(hql, Constant._HIBERNATE_ORCL);
			if (url == null) {
				url = new RootUrl();
				url.setUrl(string);
			}
			// 获取网页
			String webInfo = WebInfo.getWebInfoByHttpURLConnection(string);
			if (webInfo == null) {
//				try {
//					webInfo = WebInfo.getWebInfoByHttpClient(string);
//					if (webInfo == null) {
				try {
					webInfo = WebInfo.getWebInfoByHttpClient2(string);
				} catch (IOException e) {
					if (webInfo == null) {
						url.setFlag("-1");
						modifyFlag(url);
						return;
					}
				}
//					}
//				} catch (UnsupportedOperationException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
			}
			// 解析网页头
			getMetiaFromHtmlBody(webInfo, url);
			dao.saveOrUpdate(url, Constant._HIBERNATE_ORCL);
		}
		
	}
	
	/**
	 * 方法名： modifyFlag
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param url
	 * 返 回： void
	 * 作 者 ： wang
	 * @throws
	 */
	private static void modifyFlag(RootUrl url) {
		HibernateDaoImpl<RootUrl> dao = new HibernateDaoImpl<RootUrl>();
		url.setUpdateTimestimp(new Date());
		url.setInsertTimestimp(new Date());
		dao.saveOrUpdate(url, Constant._HIBERNATE_ORCL);
		
	}
	
	/**
	 * 方法名： getMetiaFromHtmlBody
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param webInfo
	 * 参 数： @param url
	 * 返 回： void
	 * 作 者 ： wang
	 * @throws
	 */
	private static void getMetiaFromHtmlBody(String webInfo, RootUrl url) {
		if (webInfo == null || "".equals(webInfo)) {
			System.err.println("fds");
			return;
		}
		Document doc = Jsoup.parse(webInfo);
		System.out.println(doc.select("head").toString());
		if (doc.select("head").toString().equals("<head></head>")) {
			try {
				doc = Jsoup.connect(url.getUrl()).get();
			} catch (IOException e) {
				System.out.println("123456789");
			}
		}
		Elements meta = doc.select("head").select("meta");
		Elements link = doc.select("head").select("link");
		// 标题
		url.setTitle(doc.title().trim());
		// 图标
		for (Element element : link) {
			String icon_rel = element.attr("rel");
			if (icon_rel.toLowerCase().contains("icon")) {
				url.setLink(element.attr("abs:href"));
				break;
			}
		}
		// meda
		Map<String, String> equivmap = new HashMap<String, String>();
		Map<String, String> namemap = new HashMap<String, String>();
		for (Element element : meta) {
			// 内容
			String content = element.attr("content").trim();
			// 字符集
			if (content.contains("charset")) {
				String[] set = content.split(";");
				String charset = null;
				for (String string : set) {
					if (string.contains("charset")) {
						charset = string.replace("charset", "").replaceAll("=", "").trim();
					}
				}
				// 字符集
				url.setCharset(charset);
			}
			
			String equiv = element.attr("http-equiv").trim();
			String name = element.attr("name").trim();
			if (equiv != null && !"".equals(equiv)) {
				equivmap.put(equiv, content);
			} else if ("robots".equals(name)) {
				url.setRobots(content);
			} else if ("keyword".equals(name) || "keywords".equals(name)) {
				url.setKeyword(content);
			} else if ("author".equals(name)) {
				url.setAuthor(content);
			} else if ("build".equals(name)) {
				url.setBuild(content);
			} else if ("coprright".equals(name)) {
				url.setCoprright(content);
			} else if ("reply-to".equals(name)) {
				url.setReplyTo(content);
			} else if ("description".equals(name)) {
				url.setDescription(content);
			} else if ("generator".equals(name)) {
				url.setGenerator(content);
			} else if ("revisit-after".equals(name)) {
				url.setRevisitAfter(content);
			} else if ("document-state".equals(name)) {
				url.setDocumentState(content);
			} else if ("viewport".equals(name)) {
				url.setViewport(content);
			} else {
				namemap.put(name, content);
			}
			// 字符集
			if (url.getCharset() == null) {
				url.setCharset(element.attr("charset").trim());
			}
		}
		try {
			url.setHttpEquiv(new javax.sql.rowset.serial.SerialClob(JSON.toJSON(equivmap).toString().toCharArray()));
			url.setName(new javax.sql.rowset.serial.SerialClob(JSON.toJSON(namemap).toString().toCharArray()));
		} catch (SerialException e) {
		} catch (SQLException e) {
		}
		
	}
	
}
