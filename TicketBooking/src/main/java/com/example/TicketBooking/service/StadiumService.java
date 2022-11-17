package com.example.TicketBooking.service;

import java.util.*;

import com.example.TicketBooking.model.Stadium;

public interface StadiumService {

	public java.util.List<Stadium> getAllStadiums();

	public void addStadium(Stadium st);

	public Stadium findByStdId(int id);

	public long generateStdId();

	public long totalStadium();

	public void removeStadium(int id);
	
	public List<Stadium> getActiveStadium() ;
}
