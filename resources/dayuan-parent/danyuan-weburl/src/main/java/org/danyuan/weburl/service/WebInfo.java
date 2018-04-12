package org.danyuan.weburl.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

/**
 * 文件名 ： WebInfo.java
 * 包 名 ： org.danyuan.weburl.service
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： wang
 * 时 间 ： 2016年10月7日 下午4:18:34
 * 版 本 ： V1.0
 */
public class WebInfo {
	
	/**
	 * 方法名： getWebInfoByHttpURLConnection
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param url
	 * 参 数： @return
	 * 返 回： String
	 * 作 者 ： wang
	 * @throws
	 */
	public static String getWebInfoByHttpURLConnection(String url) {
		try {
			java.net.URL urltemp = new java.net.URL(url); // 根据 String 表示形式创建 URL 对象。
			java.net.HttpURLConnection conn = (java.net.HttpURLConnection) urltemp.openConnection(); // 返回一个 URLConnection 对象，它表示到 URL 所引用的远程对象的连接。
			conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
			conn.setConnectTimeout(10000);
			java.io.InputStreamReader isr = new java.io.InputStreamReader(conn.getInputStream()); // 返回从此打开的连接读取的输入流。
			java.io.BufferedReader br = new java.io.BufferedReader(isr); // 创建一个使用默认大小输入缓冲区的缓冲字符输入流。
			
			String temp;
			StringBuffer html = new StringBuffer();
			while ((temp = br.readLine()) != null) { // 按行读取输出流
				if (!temp.trim().equals("")) {
					html.append(temp).append("\n"); // 读完每行后换行
				}
			}
			br.close(); // 关闭
			isr.close(); // 关闭
			return html.toString(); // 返回此序列中数据的字符串表示形式。
		} catch (Exception e) {
			return null;
		}
		
	}
	
	/**
	 * 方法名： getWebInfoByHttpClient
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param url
	 * 参 数： @return
	 * 参 数： @throws UnsupportedOperationException
	 * 参 数： @throws IOException
	 * 返 回： String
	 * 作 者 ： wang
	 * @throws
	 */
	public static String getWebInfoByHttpClient(String url) throws UnsupportedOperationException, IOException {
		HttpParams httpParams = new BasicHttpParams();
		
		HttpConnectionParams.setConnectionTimeout(httpParams, 5000); // 设置连接超时为5秒
		
		HttpClient client = new DefaultHttpClient(httpParams); // 生成一个http客户端发送请求对象
		
		HttpPost httpPost = new HttpPost(url); // 设定请求方式
		
		HttpResponse httpResponse = client.execute(httpPost); // 发送请求并等待响应
		// 获取请求头里的数据
		Header[] ResponseHeaders = httpResponse.getAllHeaders();
		for (int i = 0; i < ResponseHeaders.length; i++) {
			String name = ResponseHeaders[i].getName();
			String value = ResponseHeaders[i].getValue();
			System.out.println(name + "= :" + value);
		}
		// 判断网络连接是否成功
		if (httpResponse.getStatusLine().getStatusCode() != 200) {
			System.out.println("网络错误异常！!!!");
			
			return null;
		}
		
		HttpEntity entity = httpResponse.getEntity(); // 获取响应里面的内容
		InputStream inputStream = entity.getContent(); // 得到服务气端发回的响应的内容（都在一个流里面）
		// 得到服务气端发回的响应的内容（都在一个字符串里面）
		// String strResult = EntityUtils.toString(entity);
		System.out.println(inputStream.toString());
		return inputStream.toString();
	}
	
	/**
	 * 方法名： getWebInfoByHttpClient2
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param url
	 * 参 数： @return
	 * 参 数： @throws IOException
	 * 返 回： String
	 * 作 者 ： wang
	 * @throws
	 */
	public static String getWebInfoByHttpClient2(String url) throws IOException {
		org.apache.commons.httpclient.HttpClient client = new org.apache.commons.httpclient.HttpClient();
		// 设置代理服务器地址和端口
		// client.getHostConfiguration().setProxy("proxy_host_addr",proxy_port);
		// 使用GET方法，如果服务器需要通过HTTPS连接，那只需要将下面URL中的http换成https
		org.apache.commons.httpclient.HttpMethod method = new GetMethod(url);
		// 使用POST方法
		// HttpMethod method = new PostMethod("http://java.sun.com";);
		client.executeMethod(method);
		String str = null;
		// 打印服务器返回的状态
		if ("HTTP/1.0 200 OK".equals(method.getStatusLine())) {
			
			// 打印返回的信息
			str = method.getResponseBodyAsString();
		}
		// 释放连接
		method.releaseConnection();
		return str;
	}
	
	public static void main(String[] args) throws IOException {
		getWebInfoByHttpClient2("http://blog.chinaunix.net/uid-7591044-id-1742965.html");
	}
}
