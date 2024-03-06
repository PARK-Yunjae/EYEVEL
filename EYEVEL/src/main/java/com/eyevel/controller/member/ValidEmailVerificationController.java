package com.eyevel.controller.member;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import com.eyevel.frontController.Controller;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 비동기 이메일 인증 - 회원가입
public class ValidEmailVerificationController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String email = req.getParameter("email");

		final String fromEmail = "dbswoql0712@gmail.com"; // 수정: 이메일 발신자 주소
		final String password = "mhxy mmuw vagr tnnv"; // 애플리케이션별 비밀번호로 변경

		// SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props, new jakarta.mail.Authenticator() {
			protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
				return new jakarta.mail.PasswordAuthentication(fromEmail, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 받는 사람 이메일
			message.setSubject("이메일 인증번호"); // 이메일 제목

			// 인증번호 생성
			String authCode = generateVerificationCode();
			message.setText("귀하의 인증번호는 " + authCode + " 입니다."); // 이메일 내용

			// 이메일 전송
			Transport.send(message);

			res.getWriter().write(authCode);
		} catch (MessagingException e) {
			e.printStackTrace();
			res.getWriter().write("인증번호 발송 실패");
		}
		return null;
	}

	// 인증번호 생성 메소드
	private String generateVerificationCode() {
		Random random = new Random();
		int num = random.nextInt(999999); // 0부터 999999까지의 난수 생성
		return String.format("%06d", num); // 6자리 숫자로 포맷
	}
}
