package com.iwt.nit.aws.helper;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncoder {
	public static String encodePassword(String password) {
		String output = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.update(password.getBytes());
			byte[] hash = digest.digest();
			for (byte b : hash) {
				int i = b + 128;
				output = output
						+ String.format("%x",
								new Object[] { Integer.valueOf(i) });
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return output;
	}
}