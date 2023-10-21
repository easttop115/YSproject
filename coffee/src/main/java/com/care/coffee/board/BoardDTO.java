package com.care.coffee.board;
/*
create table megaNotice(
no number, 
subject varchar2(30),
content varchar2(200),
reg_date varchar2(20),
hits number,
primary key(no));
*/
public class BoardDTO {
	private int no;	
	private String subject;
	private String content;
	private String reg_date;
	private int hits;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	

	
}
