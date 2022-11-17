package com.example.TicketBooking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Ticket;

@Repository
public interface TicketRepo extends JpaRepository<Ticket, Integer> {

	Optional<Ticket> findByApplicationId(int id);
	
}
