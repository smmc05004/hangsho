package kr.co.hangsho.web.code;

import java.time.LocalDate;

import org.apache.commons.codec.digest.DigestUtils;

public class CodeGenerator {

	private static String targetCode="admin";
	public static String getTargetCode() {
		return targetCode;
	}
	
	public static String generateCode() {
		return DigestUtils.sha256Hex(getTargetCode()+LocalDate.now());
	}
}