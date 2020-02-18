package com.hexudong.cms.pojo;

public enum Pic {

	HTML("文章"),
	IMAGE("图片");

	private String disPlayName;
	
	
	public String getDisPlayName() {
		return disPlayName;
	}

	public void setDisPlayName(String disPlayName) {
		this.disPlayName = disPlayName;
	}

	private Pic(String disPlayName) {
		this.disPlayName = disPlayName;
	}

	
	
	private String disPlayName() {
		return this.disPlayName();
	}
	
	
}
