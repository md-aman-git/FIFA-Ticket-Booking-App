package com.example.TicketBooking.service;

import com.example.TicketBooking.model.Ticket;

public interface TicketService {

	public Ticket findById(int id);

	public Ticket findByApplicationId(int id);
}
