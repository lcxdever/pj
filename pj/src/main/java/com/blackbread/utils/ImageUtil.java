package com.blackbread.utils;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImageUtil {
	// 获取img标签正则  
    private static final String IMGURL_REG = "<img.*src=(.*?)[^>]*?>";  
    // 获取src路径的正则  
    private static final String IMGSRC_REG = "http:\"?(.*?)(\"|>|\\s+)";  
    public static void main(String[] args) throws Exception {  
    	getImageSrc(getImageUrl("<p><img src=\"http://img.baidu.com/hi/jx2/j_0018.gif\" _src=\"http://img.baidu.com/hi/jx2/j_0018.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0062.gif\" _src=\"http://img.baidu.com/hi/jx2/j_0062.gif\"/></p>"));    }  
    /*** 
     * 获取ImageUrl地址 
     *  
     * @param HTML 
     * @return 
     */  
    public static List<String> getImageUrl(String HTML) {  
        Matcher matcher = Pattern.compile(IMGURL_REG).matcher(HTML);  
        List<String> listImgUrl = new ArrayList<String>();  
        while (matcher.find()) {  
            listImgUrl.add(matcher.group());  
        }  
        return listImgUrl;  
    }  
  
    /*** 
     * 获取ImageSrc地址 
     *  
     * @param listImageUrl 
     * @return 
     */  
    public static List<String> getImageSrc(List<String> listImageUrl) {  
        List<String> listImgSrc = new ArrayList<String>();  
        for (String image : listImageUrl) {  
            Matcher matcher = Pattern.compile(IMGSRC_REG).matcher(image);  
            while (matcher.find()) {  
                listImgSrc.add(matcher.group().substring(0, matcher.group().length() - 1));  
            }  
        }  
        return listImgSrc;  
    }  
}
