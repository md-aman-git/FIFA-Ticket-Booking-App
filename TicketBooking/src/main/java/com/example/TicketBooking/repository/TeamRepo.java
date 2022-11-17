package com.example.TicketBooking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Team;

@Repository
public interface TeamRepo extends JpaRepository<Team, Integer>{
	Team findFirstByOrderByIdDesc();
	List<Team> findAllByPool(String pool);
}
