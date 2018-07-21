package com.oracle.shangcheng.model.bean;

public class wine {

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((detail == null) ? 0 : detail.hashCode());
		result = prime * result + ((kind == null) ? 0 : kind.hashCode());
		result = prime * result + ((path == null) ? 0 : path.hashCode());
		result = prime * result + Float.floatToIntBits(price);
		result = prime * result + tuisong;
		result = prime * result + wine_id;
		result = prime * result + ((wine_name == null) ? 0 : wine_name.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		wine other = (wine) obj;
		if (detail == null) {
			if (other.detail != null)
				return false;
		} else if (!detail.equals(other.detail))
			return false;
		if (kind == null) {
			if (other.kind != null)
				return false;
		} else if (!kind.equals(other.kind))
			return false;
		if (path == null) {
			if (other.path != null)
				return false;
		} else if (!path.equals(other.path))
			return false;
		if (Float.floatToIntBits(price) != Float.floatToIntBits(other.price))
			return false;
		if (tuisong != other.tuisong)
			return false;
		if (wine_id != other.wine_id)
			return false;
		if (wine_name == null) {
			if (other.wine_name != null)
				return false;
		} else if (!wine_name.equals(other.wine_name))
			return false;
		return true;
	}
	private int wine_id;
	private String wine_name;
	private String kind;
	private float price;
	private String detail;
	private String path;
	private int tuisong;
	public int getTuisong() {
		return tuisong;
	}
	public void setTuisong(int tuisong) {
		this.tuisong = tuisong;
	}
	public int getWine_id() {
		return wine_id;
	}
	public void setWine_id(int wine_id) {
		this.wine_id = wine_id;
	}
	public String getWine_name() {
		return wine_name;
	}
	public void setWine_name(String wine_name) {
		this.wine_name = wine_name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public wine(int wine_id, String wine_name, String kind, float price, String detail, String path) {
		super();
		this.wine_id = wine_id;
		this.wine_name = wine_name;
		this.kind = kind;
		this.price = price;
		this.detail = detail;
		this.path = path;
	}
	public wine(int wine_id) {
		super();
		this.wine_id = wine_id;
	}
	public wine() {
		super();

	}
	@Override
	public String toString() {
		return "wine [wine_id=" + wine_id + ", wine_name=" + wine_name + ", kind=" + kind + ", price=" + price
				+ ", detail=" + detail + ", path=" + path + ", tuisong=" + tuisong + "]";
	}
	
	
}
