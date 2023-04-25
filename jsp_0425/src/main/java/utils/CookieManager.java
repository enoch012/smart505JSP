package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
  // 명시한 이름, 값, 유지 기간 조건으로 쿠키를 생성합니다
  // 클라이언트로 데이터를 전송하기 위한 response 내장 객체와 쿠키 이름, 쿠키 값, 쿠키 유지 시간이 매개변수
  public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime){
    Cookie cookie = new Cookie(cName, cValue);
    cookie.setPath("/");
    cookie.setMaxAge(cTime);
    response.addCookie(cookie); // 클라이언트로 전송하기 위해 response 내장 객체에 쿠키 추가
  }

  // 쿠키 읽어 오기
  // 클라이언트에서 전송된 데이터를 가지고 있는 request 내장 객체과 쿠키 이름을 매개변수로 받음
  // 명시한 이름의 쿠키를 찾아 그 값을 반환합니다.
  public static String readCookie(HttpServletRequest request, String cName){
    String cookieValue = ""; // 반환값

    // 모든 쿠키 데이터 가져오기
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
      for(Cookie c : cookies){
        String cookieName = c.getName();

        // 지정한 쿠키 이름과 같을 경우 변수에 쿠키값 저장
        if (cookieName.equals(cName)){
          cookieValue = c.getValue(); // 반환 값 갱신
        }
      }
    }
    return cookieValue;
  }

  public static void deleteCookie(HttpServletResponse response, String cName){
    makeCookie(response, cName, "", 0); // 유지시간을 0으로 설정해 삭제
  }
}
