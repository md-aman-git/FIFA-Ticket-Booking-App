package com.example.TicketBooking.service.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Category;
import com.example.TicketBooking.model.Team;
import com.example.TicketBooking.repository.CategoryRepo;
import com.example.TicketBooking.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryRepo categoryRepo;

	public List<Category> getAllCategories() {
		return categoryRepo.findAll(Sort.by(Sort.Direction.ASC, "id"));
	}

	public void addCategory(Category c) {
		if (categoryRepo.existsById(c.getId())) {
			Category cat = categoryRepo.findById(c.getId()).get();
			cat.setName(c.getName());
			cat.setPrice(c.getPrice());
			cat.setUpdated_by(1);
			categoryRepo.save(cat);
		} else {
			c.setIs_active("YES");
			c.setCreated_by(1);
			categoryRepo.save(c);
		}
	}

	public Category findById(int id) {
		Optional<Category> t = categoryRepo.findById(id);
		return t.get();
	}

	public long generateCategoryId() {
		int count = 0;
		try {
			count=categoryRepo.findFirstByOrderByIdDesc().getId();
		} catch (Exception e) {

			count = 0;
		}
		return count + 1;
	}

	public void removeCategory(int id) {
		 Category ct = categoryRepo.findById(id).get();
		 ct.setIs_active("NO");
		categoryRepo.deleteById(id);
	}

}
