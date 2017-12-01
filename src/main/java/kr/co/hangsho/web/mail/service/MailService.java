package kr.co.hangsho.web.mail.service;

public interface MailService {

	public boolean sendMail(String to, String subject, String content);
}
