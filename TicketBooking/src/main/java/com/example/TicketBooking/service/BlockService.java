package com.example.TicketBooking.service;

import com.example.TicketBooking.model.Application;

public interface BlockService {

	public void fillBlock(Application a, int id);

	public void sellTickets(int id,int match);

}
