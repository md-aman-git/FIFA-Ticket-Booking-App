package com.example.TicketBooking.service.serviceImpl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Application;
import com.example.TicketBooking.model.Block;
import com.example.TicketBooking.model.Buyer;
import com.example.TicketBooking.model.Category;
import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.model.Ticket;
import com.example.TicketBooking.model.User;
import com.example.TicketBooking.repository.ApplicationRepo;
import com.example.TicketBooking.repository.BlockRepo;
import com.example.TicketBooking.repository.TicketRepo;
import com.example.TicketBooking.service.ApplicationService;

@Service
public class ApplicationServiceImpl implements ApplicationService {

	@Autowired
	ApplicationRepo applicationRepo;

	@Autowired
	BlockRepo blockRepo;

	@Autowired
	TicketRepo ticketRepo;

	public List<Application> getAllApplications() {
		return applicationRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
	}

	public Application addApplication(Application app, User user, Category category, int match_id) {
		app.setCategory(category);
		app.setUser(user);
		app.setIs_active("YES");
		app.setCreated_by(2);
		app.setStatus("InProgress");
		app.setMatches_id(match_id);
		long no = (int) (app.hashCode() / 4);
		app.setNo("A" + String.valueOf(no).substring(0, 5));
		return applicationRepo.save(app);

	}

	public Application findById(int id) {
		return applicationRepo.findById(id).get();
	}

	public void payment(Ticket tt, Application app, User user) {
		app.setStatus("Completed");
		app.setUpdated_by(2);
		Block b = app.getBlock();
		Set<Buyer> buyer = app.getBuyers();
		int purchagers = (app.getBuyers().size());
		String[] seats = new String[purchagers];
		for (int j = 1; j <= purchagers; j++) {
			int availableSeats = b.getAvailable_seats() - 1;
			b.setAvailable_seats(availableSeats);
			int seatNumber = b.getSeats() - availableSeats;
			String tempStr = String.valueOf(seatNumber);
			String seatNo = "S";
			// S001
			for (int i = 0; i < 3 - tempStr.length(); i++) {
				seatNo += "0";
			}
			seatNo += tempStr;
			seats[j - 1] = seatNo;
		}
		tt.setIs_active("YES");
		tt.setCreated_by(1);
		tt.setUpdated_by(1);
		tt.setApplication(app);
		int k = 0;
		Set<Buyer> buyers = tt.getApplication().getBuyers();
		Iterator<Buyer> itr = buyers.iterator();
		while (itr.hasNext()) {
			itr.next().setSeat_no(seats[k++]);

		}
		String no = "T" + String.valueOf(tt.hashCode() / 4).substring(0, 5);
		tt.setNo(no);
		tt.getApplication().setBuyers(buyers);
		// tt number have to be set with u.
		app.setIs_active("NO");
		tt.setUser(user);
		blockRepo.save(b);
		app.setUpdated_by(1);
		applicationRepo.save(app);
		ticketRepo.save(tt);
	}

}
