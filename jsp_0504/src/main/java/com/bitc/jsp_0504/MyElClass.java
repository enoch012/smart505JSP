package com.bitc.jsp_0504;

public class MyElClass {
  public String getGender(String jumin){
    String returnStr = "";

    // 주민번호 '-' 바로 다음 글자를 지정
    int beginIdx = jumin.indexOf("-") + 1; // bedinIdx = 7
    String genderStr = jumin.substring(beginIdx, beginIdx + 1); // 1글자만 잘라옴 뒷 숫자 직전까지 잘라오는 거기 때문에
    int genderInt = Integer.parseInt(genderStr); // 잘라온 문자열을 숫자로 바꿈

    if (genderInt == 1 || genderInt == 3) {
      returnStr = "남자";
    } else if (genderInt == 2 || genderInt == 4) {
      returnStr = "여자";
    } else { returnStr = "주민번호 오류입니다.";}

    return returnStr;
  }

  // 입력 받은 문자열이 숫자인지 판별, 문자열에 숫자가 하나라도 있다면 false를 반환한다.
  public static boolean isNumber(String value){
    char[] chArr = value.toCharArray();
    for (int i = 0; i < chArr.length; i++) {
      if (!(chArr[i] >= '0' && chArr[i] <= '9')){
        return false;
      }
    }
    return true;
  }

  // 입력 받은 정수 까지의 구구단을 HTML 테이블로 출력
  public static String showGugudan(int limitDan){
    StringBuffer sb = new StringBuffer();
    try {
      sb.append("<table border = '1'>");
      for (int i = 2; i <= limitDan ; i++) {
        sb.append("<tr>");
        for (int j = 1; j <= 9 ; j++) {
          sb.append("<td>" + i + "*" + j + " = " + (i * j) + "</td>");
        }
        sb.append("</tr>");
      }
      sb.append("</table>");
    } catch (Exception e){
      e.printStackTrace();
    }
    return sb.toString();
  }

}
