package org.danyuan.utils.pwntcha;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class MyStringUtils {
	
	private static Log logger = LogFactory.getLog(MyStringUtils.class);
	
	public static String decodeHTMLContent(String pageContent) {
		Pattern pattern = Pattern.compile("\\\\u[0-9a-f]{4}", 2);
		Matcher matcher = pattern.matcher(pageContent);
		
		while (matcher.find()) {
			int d = Integer.parseInt(matcher.group().substring(2), 16);
			char c = (char) d;
			pageContent = pageContent.replace(matcher.group(), Character.toString(c));
		}
		return pageContent;
	}
	
	public static String getMapHtml(String content, String savePath, String localurl) {
		try {
			File sf = new File(savePath);
			if (!sf.exists()) {
				sf.mkdirs();
			}
			File file = new File(localurl);// 要写入的文本文件  
			String charset = "UTF-8";
			if (!file.exists()) {// 如果文件不存在，则创建该文件  
				file.createNewFile();
			}
			//  FileWriter writer = new FileWriter(file);// 获取该文件的输出流  
			Writer writer = new OutputStreamWriter(new FileOutputStream(file, true), "GBK");;// 获取该文件的输出流  
			writer.write(content);// 写内容  
			writer.flush();// 清空缓冲区，立即将输出流里的内容写到文件里  
			writer.close();// 关闭输出流，施放资源  
			
		} catch (Exception e) {
		
		}
		return content;
	}
	
	public static long string2Long(String time) {
		long longTime = 0L;
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			longTime = df.parse(time).getTime();
		} catch (ParseException e) {
			longTime = System.currentTimeMillis();
			logger.info(e.getMessage());
		}
		return longTime;
	}
	
	public static String getStrByRegex(String content, String regex) {
		String findStr = "";
		if (content != null) {
			Pattern pattern = Pattern.compile(regex, Pattern.DOTALL | Pattern.CASE_INSENSITIVE);
			Matcher matcher = pattern.matcher(content);
			if (matcher.find()) {
				findStr = matcher.group(1);
			}
		}
		return findStr;
	}
	
	public static String getdateTJRQ() {
		java.text.SimpleDateFormat formatter_f = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date currentTime_f = new java.util.Date(); // 得到当前系统时间
		String new_date_f = formatter_f.format(currentTime_f); // 将日期时间格式化
		//System.out.println(new_date_f);
		return new_date_f;
	}
	
	public static String getdateTJRQ1() {
		java.text.SimpleDateFormat formatter_f = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date currentTime_f = new java.util.Date(); // 得到当前系统时间
		String new_date_f = formatter_f.format(currentTime_f); // 将日期时间格式化
		//System.out.println(new_date_f);
		return new_date_f;
	}
	
	//获取一定范围的随机数
	public static int getRanDom() {
		int num = new Random().nextInt(100);
		while (num == 2 || num == 7) {
			num = new Random().nextInt(100);
		}
		System.out.println(num);
		return num;
	}
	
	//获取前一天
	public static String getBeforeDay(int i) {
		//        Calendar calendar = Calendar.getInstance();  
		//        calendar.setTime(date);  
		//        calendar.add(Calendar.DAY_OF_MONTH, -1);  
		//        date = calendar.getTime();  
		//        return date;  
		Date dNow = new Date(); //当前时间
		Date dBefore = new Date();
		Calendar calendar = Calendar.getInstance(); //得到日历
		calendar.setTime(dNow);//把当前时间赋给日历
		calendar.add(Calendar.DAY_OF_MONTH, -i); //设置为前一天
		dBefore = calendar.getTime(); //得到前一天的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式
		String defaultStartDate = sdf.format(dBefore); //格式化前一天
		String defaultEndDate = sdf.format(dNow); //格式化当前时间
		//System.out.println("前一天的时间是：" + defaultStartDate);
		//System.out.println("生成的时间是：" + defaultEndDate);
		return defaultStartDate;
	}
	
	public static String getBeforeDay1(int i) {
		//      Calendar calendar = Calendar.getInstance();  
		//      calendar.setTime(date);  
		//      calendar.add(Calendar.DAY_OF_MONTH, -1);  
		//      date = calendar.getTime();  
		//      return date;  
		Date dNow = new Date(); //当前时间
		Date dBefore = new Date();
		Calendar calendar = Calendar.getInstance(); //得到日历
		calendar.setTime(dNow);//把当前时间赋给日历
		calendar.add(Calendar.DAY_OF_MONTH, -i); //设置为前一天
		dBefore = calendar.getTime(); //得到前一天的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); //设置时间格式
		String defaultStartDate = sdf.format(dBefore); //格式化前一天
		String defaultEndDate = sdf.format(dNow); //格式化当前时间
		//System.out.println("前一天的时间是：" + defaultStartDate);
		//System.out.println("生成的时间是：" + defaultEndDate);
		return defaultStartDate;
	}
	
	//通过流下载文件
	public static void download(String urlString, String filename, String savePath) throws Exception {
		// 构造URL  
		URL url = new URL(urlString);
		// 打开连接  
		URLConnection con = url.openConnection();
		//设置请求超时为20s  
		con.setConnectTimeout(20 * 1000);
		// 输入流  
		InputStream is = con.getInputStream();
		String charset = "utf-8";
		InputStreamReader inr = new InputStreamReader(is, charset);
		//  InputStream inr = new InputStream(is, charset); 
		
		// 1K的数据缓冲  
		byte[] bs = new byte[1024 * 10];
		// 读取到的数据长度  
		int len;
		// 输出的文件流  
		File sf = new File(savePath);
		if (!sf.exists()) {
			sf.mkdirs();
		}
		OutputStream os = new FileOutputStream(sf.getPath() + "\\" + filename);
		// 开始读取  
		while ((len = is.read(bs)) > 0) {
			os.write(bs, 0, len);
		}
		// 完毕，关闭所有链接  
		os.close();
		is.close();
	}
	
	private static void downloadpdf(String href, String filename, String savePath) {
		
		List<String> pdfList = new ArrayList<String>();
		pdfList.add(href);
		System.err.println(href);
		try {
			String dir = "e:/pdf/";
			File file = new File(dir);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 遍历pdf地址的list，逐个下载
			for (String pdf : pdfList) {
				URL url = new URL(pdf);
				// 打开连接  
				URLConnection con = url.openConnection();
				//设置请求超时为5s  
				con.setConnectTimeout(5 * 1000);
				// 输入流  
				InputStream is = con.getInputStream();
				
				// 1K的数据缓冲  
				byte[] bs = new byte[1024 * 10];
				// 读取到的数据长度  
				int len;
				// 输出的文件流  
				File sf = new File(savePath);
				if (!sf.exists()) {
					sf.mkdirs();
				}
				OutputStream os = new FileOutputStream(sf.getPath() + "\\" + filename);
				// 开始读取  
				while ((len = is.read(bs)) > 0) {
					os.write(bs, 0, len);
				}
				// 完毕，关闭所有链接  
				os.close();
				is.close();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getdate() {
		java.text.SimpleDateFormat formatter_f = new java.text.SimpleDateFormat("yyyyMMdd ");
		java.util.Date currentTime_f = new java.util.Date(); // 得到当前系统时间
		String new_date_f = formatter_f.format(currentTime_f); // 将日期时间格式化
		//System.out.println(new_date_f);
		return new_date_f;
	}
	
	public static void getTxt(String url, String localurl) throws ClientProtocolException, IOException {
		HttpClient client = new DefaultHttpClient();
		//System.err.println(url);
		//System.out.println(localurl);
		HttpGet get = new HttpGet(url);
		//		get.setHeader("Accept", "tet/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
		//		get.setHeader("Accept-Encoding", "gzip,deflate,sdch");
		//		get.setHeader("Accept-Language", "zh-CN,zh;q=0.8");
		//		get.setHeader("Cache-Control", "max-age=0");
		//		get.setHeader("Connection", "keep-alive");
		//		get.setHeader("Cookie", "emstat_bc_emcount=16922334343161989086; ASP.NET_SessionId=agaboi55x1cc1gmtk4wx4a45; EMFUND0=null; EMFUND1=null; EMFUND2=null; EMFUND3=null; EMFUND4=null; EMFUND5=null; EMFUND6=null; EMFUND7=null; EMFUND8=05-28%2015%3A13%3A11@%23%24%u5927%u6210%u666F%u9E4F%u7075%u6D3B%u914D%u7F6E%u6DF7%u5408@%23%24001333; EMFUND9=05-29 09:59:20@#$%u5B89%u4FE1%u5E73%u7A33%u589E%u957F%u6DF7%u5408%u53D1%u8D77@%23%24750005; pgv_pvi=6378411100; pgv_info=ssi=s8207755864; emstat_ss_emcount=4_1432897096_2214806417");
		//		get.setHeader("Host", "fund.eastmoney.com");
		//		get.setHeader("Referer", "http://fund.eastmoney.com/company/f10/jjjl_80163340.html");
		//		get.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36");
		HttpResponse response = client.execute(get);
		String content = MyStringUtils.decodeHTMLContent(EntityUtils.toString(response.getEntity(), "gbk"));
		//System.out.println(content);
		byte bytes[] = { (byte) 0xC2, (byte) 0xA0 };
		String UTFSpace = new String(bytes, "GBK");
		Document doc = Jsoup.parse(content);
		try {
			if (doc.select("div.content").toString().equals("") == false) {
				FileWriter fw = new FileWriter(localurl);
				fw.write(doc.select("div.content").text());
				// fw.write(doc.select("pre").toString().replaceAll("<a(.*)/a>",""));
				fw.flush();
				// Thread.sleep(5);
				fw.close();
			} else {
				System.out.println("内容为空");
			}
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
}
