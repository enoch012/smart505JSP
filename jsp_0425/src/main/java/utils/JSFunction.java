package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
  public static void alertLocation(String msg, String url, JspWriter out){
    try{
      // location.href :  자바스크립트에서 지원하는 원하는 페이지로 이동 명령
      String script = "" // 삽입할 자바 스크립트 코드
                    + "<script>"
                    + "   alert('" + msg + "');"
                    + "   location.href='" + url + "';"
                    + "</script>";
      out.println(script); // 자바스크립트 코드를 내장 객체로 출력(삽입)
    }catch (Exception e){}
  }

  public static void alertBack(String msg, JspWriter out){
    // history.back() : 자바스크립트에서 지원하는 이전 페이지로 이동 명령
    try {
      String script = ""
                    + "<script>"
                    + "   alert('" + msg + "');"
                    + "   history.back()"
                    + "</script>";
      out.println(script);
    }catch (Exception e){}
  }
}
