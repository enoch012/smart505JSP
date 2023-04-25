package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
  public static void alertLocation(String msg, String url, JspWriter out){
    try{
      // location.href :  �ڹٽ�ũ��Ʈ���� �����ϴ� ���ϴ� �������� �̵� ���
      String script = "" // ������ �ڹ� ��ũ��Ʈ �ڵ�
                    + "<script>"
                    + "   alert('" + msg + "');"
                    + "   location.href='" + url + "';"
                    + "</script>";
      out.println(script); // �ڹٽ�ũ��Ʈ �ڵ带 ���� ��ü�� ���(����)
    }catch (Exception e){}
  }

  public static void alertBack(String msg, JspWriter out){
    // history.back() : �ڹٽ�ũ��Ʈ���� �����ϴ� ���� �������� �̵� ���
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
