package com.example.TicketBooking.service;

import java.util.List;

import com.example.TicketBooking.model.Application;
import com.example.TicketBooking.model.Category;
import com.example.TicketBooking.model.Ticket;
import com.example.TicketBooking.model.User;

public interface ApplicationService {

	public List<Application> getAllApplications();

	public Application findById(int id);

	public void payment(Ticket tt, Application app, User user);

	public Application addApplication(Application app, User user, Category category, int match_id);
	
	

}
