package org.danyuan.utils.pwntcha;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.io.IOUtils;

public class ImagePreProcess7 {
	
	public static int isBlack(int colorInt) {
		Color color = new Color(colorInt);
		if (color.getRed() + color.getGreen() + color.getBlue() <= 300) {
			return 1;
		}
		return 0;
	}
	
	public static int isWhite(int colorInt) {
		Color color = new Color(colorInt);
		if (color.getRed() + color.getGreen() + color.getBlue() > 300) {
			return 1;
		}
		return 0;
	}
	
	public static BufferedImage removeBackgroud(String picFile) throws Exception {
		BufferedImage img = ImageIO.read(new File(picFile));
		int width = img.getWidth();
		//获取图片的宽度
		//System.out.println(width);
		int height = img.getHeight();
		//获取图片的高度
		//	System.out.println(height);
		for (int x = 0; x < width; ++x) {
			for (int y = 0; y < height; ++y) {
				if (isWhite(img.getRGB(x, y)) == 1) {
					img.setRGB(x, y, Color.WHITE.getRGB());
				} else {
					img.setRGB(x, y, Color.BLACK.getRGB());
				}
			}
		}
		return img;
	}
	
	public static List<BufferedImage> splitImage(BufferedImage img) throws Exception {
		List<BufferedImage> subImgs = new ArrayList<BufferedImage>();
		//subImgs.add(img.getSubimage(0, 0, 37, 50));
		//subImgs.add(img.getSubimage(37, 0, 37, 50));
		subImgs.add(img);
		
		//	subImgs.add(img.getSubimage(74, 0, 37, 50));
		//subImgs.add(img.getSubimage(60, 0, 20, 50));
		//		subImgs.add(img.getSubimage(80, 0, 20, 50));
		//		subImgs.add(img.getSubimage(100, 0, 20, 50));
		//		subImgs.add(img.getSubimage(120, 0, 20, 50));
		//		subImgs.add(img.getSubimage(140, 0, 20, 50));
		//		subImgs.add(img.getSubimage(160, 0, 20, 50));
		return subImgs;
	}
	
	public static Map<BufferedImage, String> loadTrainData() throws Exception {
		Map<BufferedImage, String> map = new HashMap<BufferedImage, String>();
		File dir = new File("pic");
		File[] files = dir.listFiles();
		for (File file : files) {
			//		file.getName().charAt(0)
			String name = file.getName().replaceAll(".jpg", "").replaceAll(" ", "");
			//System.out.println(name);
			while (name.contains("(")) {
				//System.out.println("你好");
				name = MyStringUtils.getStrByRegex(name, "(.*)\\(");
			}
			//System.err.println(name);
			//file.getName().replaceAll(".png","")
			map.put(ImageIO.read(file), name + "");
		}
		return map;
	}
	
	public static String getSingleCharOcr(BufferedImage img, Map<BufferedImage, String> map) {
		String result = "";
		int width = img.getWidth();
		int height = img.getHeight();
		int min = width * height;
		for (BufferedImage bi : map.keySet()) {
			int count = 0;
			Label1: for (int x = 0; x < width; ++x) {
				for (int y = 0; y < height; ++y) {
					if (isWhite(img.getRGB(x, y)) != isWhite(bi.getRGB(x, y))) {
						count++;
						if (count >= min)
							break Label1;
					}
				}
			}
			if (count < min) {
				min = count;
				result = map.get(bi);
			}
		}
		return result;
	}
	
	public static String getAllOcr(String file, int i) throws Exception {
		
		//System.out.println(file);
		BufferedImage img = removeBackgroud(file);
		//System.err.println(img);
		/**
		 * 下载整个去掉背景的图片
		 */
		ImageIO.write(img, "JPG", new File("d:\\img\\result\\" + i + ".jpg"));
		String result = "";
		//		List<BufferedImage> listImg = splitImage(img);
		//		Map<BufferedImage, String> map = loadTrainData();
		//		//System.err.println(map);
		//		String result = "";
		//		//生成分割后的图片
		//		//		for (int x = 0; x < listImg.size(); x++) {
		//		//			ImageIO.write(listImg.get(x), "JPG", new File("result6\\"+i+"."+x+".jpg"));
		//		//		}
		//		for (BufferedImage bi : listImg) {
		//			//获取单个图片的参数
		//			//System.out.println(bi);
		//			//ImageIO.write(bi, "JPG", new File("result6\\"+result+".jpg"));
		//			result += getSingleCharOcr(bi, map);
		//		}
		//ImageIO.write(img, "JPG", new File("result\\" + result + ".jpg"));
		return result;
	}
	
	public static void downloadImage() {
		HttpClient httpClient = new HttpClient();
		GetMethod getMethod = new GetMethod("http://www.puke888.com/authimg.php");
		for (int i = 0; i < 30; i++) {
			try {
				// ִ��getMethod
				int statusCode = httpClient.executeMethod(getMethod);
				if (statusCode != HttpStatus.SC_OK) {
					System.err.println("Method failed: " + getMethod.getStatusLine());
				}
				// ��ȡ����
				String picName = "img\\" + i + ".jpg";
				InputStream inputStream = getMethod.getResponseBodyAsStream();
				OutputStream outStream = new FileOutputStream(picName);
				IOUtils.copy(inputStream, outStream);
				outStream.close();
				System.out.println(i + "OK!");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// �ͷ�l��
				getMethod.releaseConnection();
			}
		}
	}
	
	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		for (int i = 0; i < 1; i++) {
			String text = getAllOcr("img6\\" + i + ".jpeg", i);
			System.out.println(i + ".jepg = " + text);
		}
	}
}
