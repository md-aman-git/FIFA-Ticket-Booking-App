package com.example.TicketBooking.service;

public interface EmailService {

	public boolean sendMail(String email, String content);

	public String getHTMLString(String filename);

	public String generateOtp();
}
