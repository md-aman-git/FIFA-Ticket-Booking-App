package com.example.TicketBooking.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Category;


public interface CategoryService {

	public List<Category> getAllCategories();

	public void addCategory(Category c);

	public Category findById(int id);

	public long generateCategoryId();

	public void removeCategory(int id);

}
