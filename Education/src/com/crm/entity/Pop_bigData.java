package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Pop_bigData {
	private Integer value;
	private String name;
	public Pop_bigData(Integer value, String name) {
		super();
		this.value = value;
		this.name = name;
	}
	public Pop_bigData() {
		super();
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Pop_bigData [value=" + value + ", name=" + name + "]";
	}
	
}
