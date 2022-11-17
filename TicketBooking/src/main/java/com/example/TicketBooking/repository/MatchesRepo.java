package com.example.TicketBooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Matches;

@Repository
public interface MatchesRepo extends JpaRepository<Matches,Integer> {
	Matches findFirstByOrderByIdDesc();
	
}