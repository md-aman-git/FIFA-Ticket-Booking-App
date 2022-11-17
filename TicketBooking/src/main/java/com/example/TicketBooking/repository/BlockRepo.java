package com.example.TicketBooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Block;

@Repository
public interface BlockRepo extends JpaRepository<Block, Integer> {

}
