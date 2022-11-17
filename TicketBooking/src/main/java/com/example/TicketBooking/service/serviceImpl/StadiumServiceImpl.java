package com.example.TicketBooking.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Block;
import com.example.TicketBooking.model.Category;
import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.repository.BlockRepo;
import com.example.TicketBooking.repository.CategoryRepo;
import com.example.TicketBooking.repository.StadiumRepo;
import com.example.TicketBooking.service.CategoryService;
import com.example.TicketBooking.service.StadiumService;

import java.util.*;

@Service
public class StadiumServiceImpl implements StadiumService {

	@Autowired
	private StadiumRepo stadiumRepo;

	@Autowired
	private BlockRepo blockRepo;

	@Autowired
	private CategoryService categoryService;

	public java.util.List<Stadium> getAllStadiums() {
		return stadiumRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
	}

	public void addStadium(Stadium st) {
		if (stadiumRepo.existsById(st.getId())) {
			Stadium stadium = stadiumRepo.findById(st.getId()).get();
			stadium.setStdname(st.getStdname());
			stadium.setCapacity(st.getCapacity());
			stadium.setUpdated_by(1);
			stadiumRepo.save(stadium);
		} else {

			st.setIs_active("YES");
			st.setCreated_by(1);
			st = stadiumRepo.save(st);
			Map<Integer, Block> map = new HashMap<Integer, Block>();
			List<Category> categories = categoryService.getAllCategories();
			int capacity = st.getCapacity();
			int seat = 20;
			int total = 0;
			for (int i = 0; i < categories.size(); i++) {
				Block b = new Block();
				b.setStadium(st);
				b.setCreated_by(1);
				b.setIs_active("YES");
				b.setCategory(categories.get(i));
				if (i == categories.size() - 1) {
					seat = seat + 10;
					b.setSeats(capacity - total);
					b.setAvailable_seats(capacity - total);
				} else {
					total += seat;
					b.setSeats(seat);
					b.setAvailable_seats(seat);
					seat += 10;
				}

				b = blockRepo.save(b);
				map.put(b.getId(), b);
			}
			st.setUpdated_by(1);
			st.setBlocks(map);
			stadiumRepo.save(st);

		}
	}

	public Stadium findByStdId(int id) {
		Optional<Stadium> st = stadiumRepo.findById(id);
		return st.get();
	}

	public long generateStdId() {

		int count = 0;
		try {

			count = stadiumRepo.findFirstByOrderByIdDesc().getId();
		} catch (Exception e) {
			count = 0;
		}
		return count + 1;
	}

	public long totalStadium() {
		return stadiumRepo.count();
	}

	public void removeStadium(int id) {
		Stadium stadium = stadiumRepo.findById(id).get();
		stadium.setIs_active("NO");
		stadiumRepo.save(stadium);
	}

	public List<Stadium> getActiveStadium() {
		List<Stadium> stadiums = stadiumRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		List<Stadium> activeStadium = new ArrayList<Stadium>();
		for (Stadium s : stadiums) {
			if (s.getIs_active().equals("YES")) {
				activeStadium.add(s);
			}
		}
		return activeStadium;
	}

	public java.util.List<Stadium> findAllStadiums() {
		return stadiumRepo.findAll();
	}
}
