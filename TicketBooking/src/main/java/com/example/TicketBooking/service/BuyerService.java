package com.example.TicketBooking.service;

import java.util.List;

import com.example.TicketBooking.model.Application;
import com.example.TicketBooking.model.Buyer;

public interface BuyerService {

	public Buyer saveBuyer(Buyer b);

	public Buyer findBuyer(int id);

	public List<Buyer> findAllBuyers();
	
	public void saveBuyersWithApplication(Application a, String name[], int age[]);
}
