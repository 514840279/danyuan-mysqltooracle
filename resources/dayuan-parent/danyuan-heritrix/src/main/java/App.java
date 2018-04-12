import org.archive.crawler.Heritrix;

/**
 * 文件名 ： App.java
 * 包 名 ：
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 作 者 ： Administrator
 * 时 间 ： 2016年5月14日 下午6:19:50
 * 版 本 ： V1.0
 */
public class App {
    
    public static void main(String[] args) throws Exception {
        // String[] argsa = { "-a", "admin:admin" } ;
        new Heritrix().instanceMain(args);
    }
}
