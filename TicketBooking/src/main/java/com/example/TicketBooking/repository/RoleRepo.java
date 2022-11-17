package com.example.TicketBooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Role;

@Repository
public interface RoleRepo extends  JpaRepository<Role, Integer> {

	
	
}
