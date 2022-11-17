package com.example.TicketBooking.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface EmailRepo {
	
	public boolean sendMail(String email,String content);
	
	public String getHTMLString(String file);
	
}
