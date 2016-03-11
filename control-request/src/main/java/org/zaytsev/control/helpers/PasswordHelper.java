package org.zaytsev.control.helpers;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component(value="passwordHelper")
public class PasswordHelper implements PasswordEncoder{
	
	private MessageDigest md;
	
	public PasswordHelper(){
		try {
			md= MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
	}
	
	public static String hash(CharSequence rawPassword) {
		MessageDigest md = null;
		try {
			md= MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		
		if(md == null){
			return rawPassword.toString();
		}
	
		md.update(rawPassword.toString().getBytes());

		byte byteData[]= md.digest();
		
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			String hex = Integer.toHexString(0xff & byteData[i]);
			if(hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}
		
		return hexString.toString();
	}
	
	//Verification password
	public static void main (String []args) throws ParseException{
		System.out.println(hash("admin"));//21232f297a57a5a743894a0e4a801fc3
		System.out.println(hash("user"));//ee11cbb19052e40b07aac0ca060c23ee
		
		String opd = "23.02.2016";
		String[] d =opd.split(".");
		
		DateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
		
			Date date = formatter.parse(d[2]+"."+d[1]+"."+d[0]);
			System.out.println(date);
	}
	
	@Override
	public String encode(CharSequence rawPassword) {
		if  (md == null) {
			return rawPassword.toString();
		}
		
		md.update(rawPassword.toString().getBytes());
		
		byte byteData[]= md.digest();
		
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			String hex = Integer.toHexString(0xff & byteData[i]);
			if(hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}
		
		return hexString.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		return encode(rawPassword).equals(encodedPassword);
	}

}


