package com.example.TicketBooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Category;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Integer> {
	Category findFirstByOrderByIdDesc();
}
