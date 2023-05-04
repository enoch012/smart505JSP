package com.bitc.jsp_0504;

// 자바 빈즈로 사용되는 클래스
public class Person {
  // 필드는 반드시 접근제한자를 private로 설정
  private String name;
  private int age;

  public Person(){} // 무조건 기본 생성자가 존재해야함
  // 필드에 대한 getter, setter를 생성
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public Person(String name, int age){
    this.name = name;
    this.age = age;
  }
}
