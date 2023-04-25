package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
  // ����� �̸�, ��, ���� �Ⱓ �������� ��Ű�� �����մϴ�
  // Ŭ���̾�Ʈ�� �����͸� �����ϱ� ���� response ���� ��ü�� ��Ű �̸�, ��Ű ��, ��Ű ���� �ð��� �Ű�����
  public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime){
    Cookie cookie = new Cookie(cName, cValue);
    cookie.setPath("/");
    cookie.setMaxAge(cTime);
    response.addCookie(cookie); // Ŭ���̾�Ʈ�� �����ϱ� ���� response ���� ��ü�� ��Ű �߰�
  }

  // ��Ű �о� ����
  // Ŭ���̾�Ʈ���� ���۵� �����͸� ������ �ִ� request ���� ��ü�� ��Ű �̸��� �Ű������� ����
  // ����� �̸��� ��Ű�� ã�� �� ���� ��ȯ�մϴ�.
  public static String readCookie(HttpServletRequest request, String cName){
    String cookieValue = ""; // ��ȯ��

    // ��� ��Ű ������ ��������
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
      for(Cookie c : cookies){
        String cookieName = c.getName();

        // ������ ��Ű �̸��� ���� ��� ������ ��Ű�� ����
        if (cookieName.equals(cName)){
          cookieValue = c.getValue(); // ��ȯ �� ����
        }
      }
    }
    return cookieValue;
  }

  public static void deleteCookie(HttpServletResponse response, String cName){
    makeCookie(response, cName, "", 0); // �����ð��� 0���� ������ ����
  }
}
