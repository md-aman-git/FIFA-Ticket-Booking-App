package com.example.TicketBooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Stadium;

@Repository
public interface StadiumRepo extends JpaRepository<Stadium, Integer>{

	Stadium findFirstByOrderByIdDesc();
}
