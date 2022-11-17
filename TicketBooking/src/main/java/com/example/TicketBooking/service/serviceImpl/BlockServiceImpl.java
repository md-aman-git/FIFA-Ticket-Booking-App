package com.example.TicketBooking.service.serviceImpl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Application;
import com.example.TicketBooking.model.Block;
import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.repository.ApplicationRepo;
import com.example.TicketBooking.service.BlockService;
import com.example.TicketBooking.service.EmailService;
import com.example.TicketBooking.service.StadiumService;

@Service
public class BlockServiceImpl implements BlockService {

	@Autowired
	private StadiumService stadiumService;

	@Autowired
	private ApplicationRepo applicationRepo;

	@Autowired
	private EmailService emailService;

	public void fillBlock(Application a, int id) {
		Stadium s = stadiumService.findByStdId(id);
		Map<Integer, Block> map = s.getBlocks();
		boolean flag = false;
		for (Map.Entry<Integer, Block> m : map.entrySet()) {
			Block b = m.getValue();
			if (b.getCategory().getId() == a.getCategory().getId()) {
				a.setBlock(b);
				a.setUpdated_by(1);
				applicationRepo.save(a);
				break;
			}

		}

	}

	public void sellTickets(int id, int match) {
		Stadium s = stadiumService.findByStdId(id);
		Map<Integer, Block> map = s.getBlocks();

		for (Map.Entry<Integer, Block> m : map.entrySet()) {
			Block b = m.getValue();
			Collection<Application> applications = b.getApplications();
			List<Application> ap = new ArrayList<Application>(applications);
			Collections.shuffle(ap);
			for (int i = 0; i < b.getSeats(); i++) {
				if (i < ap.size()) {
					if (ap.get(i).getStatus().equals("InProgress") && ap.get(i).getMatches_id() == match) {
						String email = ap.get(i).getUser().getEmail();
						ap.get(i).setUpdated_by(1);
						if (b.getAvailable_seats() >= ap.get(i).getBuyers().size()) {
							ap.get(i).setStatus("Payment Pending");
							String content = emailService.getHTMLString("paymentMail");
							emailService.sendMail(email, content);
						} else {
							ap.get(i).setStatus("Rejected");
							String content = emailService.getHTMLString("rejection");
							content=content.replace("{0}",ap.get(i).getNo());
							emailService.sendMail(email, content);

						}
						ap.get(i).setUpdated_by(1);
						applicationRepo.save(ap.get(i));
					}
				}
			}
		}
	}

}
