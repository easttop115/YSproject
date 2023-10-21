package com.care.coffee.menu;

public class MenuDTO {
	/*
	 	CREATE TABLE megaMenu(
		no number primary key,
		category varchar2(10),
		menuname varchar2(30),
		menuprice number,
		menuimage varchar2(255),
		menucontent varchar2(255),
		menudate varchar2(20));
	 */
	private int no; 			//제품번호
	private String category;	//제품분류
	private String menuName;	//상품명
	private int menuPrice;		//상품가격
	private String menuImage;	//상품이미지
	private String menuContent;	//상품내용
	private String menuDate;	//등록날짜
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuContent() {
		return menuContent;
	}
	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public String getMenuDate() {
		return menuDate;
	}
	public void setMenuDate(String menuDate) {
		this.menuDate = menuDate;
	}
	
	
}


