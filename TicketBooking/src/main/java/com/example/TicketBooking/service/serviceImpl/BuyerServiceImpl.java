package com.example.TicketBooking.service.serviceImpl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Application;
import com.example.TicketBooking.model.Buyer;
import com.example.TicketBooking.repository.ApplicationRepo;
import com.example.TicketBooking.repository.BuyerRepo;
import com.example.TicketBooking.service.BuyerService;

@Service
public class BuyerServiceImpl implements BuyerService {

	@Autowired
	BuyerRepo buyerRepo;
	
	@Autowired
	ApplicationRepo applicationRepo;

	public Buyer saveBuyer(Buyer b) {
		b.setIs_active("YES");
		b.setCreated_by(2);
		b.setUpdated_by(1);
		return buyerRepo.save(b);
	}

	public Buyer findBuyer(int id) {
		return buyerRepo.findById(id).get();
	}

	public List<Buyer> findAllBuyers() {
		List<Buyer> buyerList = buyerRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		return buyerList;
	}

	public void saveBuyersWithApplication(Application a, String name[], int age[]) {
		Set<Buyer> buyers = new HashSet<Buyer>();
		for (int i = 0; i < name.length; i++) {
			Buyer b = new Buyer();
			b.setAge(age[i]);
			b.setName(name[i]);
			b.setApplication(a);
			b.setIs_active("YES");
			b.setCreated_by(2);
			b = buyerRepo.save(b);
			buyers.add(b);

		}
		a.setBuyers(buyers);
		applicationRepo.save(a);
	}
}
