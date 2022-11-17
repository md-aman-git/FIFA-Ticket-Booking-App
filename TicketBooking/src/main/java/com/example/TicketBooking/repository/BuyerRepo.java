package com.example.TicketBooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Buyer;

@Repository
public interface BuyerRepo extends JpaRepository<Buyer, Integer> {

}
