package com.bitc.jsp_board_model1;

/* 회원 정보를 저장하기 위한 클래스 */
public class MemberDto {
  private String UserId;
  private String UserPw;
  private String userName;

  public String getUserId() {
    return UserId;
  }

  public void setUserId(String userId) {
    UserId = userId;
  }

  public String getUserPw() {
    return UserPw;
  }

  public void setUserPw(String userPw) {
    UserPw = userPw;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }
}
