package model.intro;

import java.sql.Timestamp;

public class IntroDto {

	private String intro_num;
	private String intro_name;
	private String intro_blood;
	private String intro_hp;
	private String intro_city;
	private Timestamp gaipday;
	public String getIntro_num() {
		return intro_num;
	}
	public void setIntro_num(String intro_num) {
		this.intro_num = intro_num;
	}
	public String getIntro_name() {
		return intro_name;
	}
	public void setIntro_name(String intro_name) {
		this.intro_name = intro_name;
	}
	public String getIntro_blood() {
		return intro_blood;
	}
	public void setIntro_blood(String intro_blood) {
		this.intro_blood = intro_blood;
	}
	public String getIntro_hp() {
		return intro_hp;
	}
	public void setIntro_hp(String intro_hp) {
		this.intro_hp = intro_hp;
	}
	public String getIntro_city() {
		return intro_city;
	}
	public void setIntro_city(String intro_city) {
		this.intro_city = intro_city;
	}
	public Timestamp getGaipday() {
		return gaipday;
	}
	public void setGaipday(Timestamp gaipday) {
		this.gaipday = gaipday;
	}
	
}
