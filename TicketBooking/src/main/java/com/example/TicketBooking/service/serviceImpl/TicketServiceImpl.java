package com.example.TicketBooking.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Ticket;
import com.example.TicketBooking.repository.TicketRepo;
import com.example.TicketBooking.service.TicketService;

@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	TicketRepo ticketRepo;
	
	
	public Ticket findById(int id) {
		return ticketRepo.findById(id).get();
	}
	
	public Ticket findByApplicationId(int id) {
		return ticketRepo.findByApplicationId(id).get();
	}
}
