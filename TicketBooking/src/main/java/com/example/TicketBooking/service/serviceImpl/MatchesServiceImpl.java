package com.example.TicketBooking.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Matches;
import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.model.Team;
import com.example.TicketBooking.repository.MatchesRepo;
import com.example.TicketBooking.service.MatchesService;
import com.example.TicketBooking.service.StadiumService;

@Service
public class MatchesServiceImpl implements MatchesService{

	@Autowired
	MatchesRepo matchesRepo;

	@Autowired
	StadiumService stadiumService;

	public long generateMatchesId() {
		int count = 0;
		try {
			count = matchesRepo.findFirstByOrderByIdDesc().getId();
		} catch (Exception e) {

			count = 0;
		}
		return count + 1;
	}

	public void addMatch(Matches m, int stdid) {
		if (matchesRepo.existsById(m.getId())) {
			Stadium stadium = stadiumService.findByStdId(stdid);
			Matches mat = matchesRepo.findById(m.getId()).get();
			mat.setSchedule(m.getSchedule());
			mat.setStadium(stadium);
			mat.setUpdated_by(1);
			matchesRepo.save(mat);
		} else {
			Stadium stadium = stadiumService.findByStdId(stdid);
			m.setStadium(stadium);
			m.setIs_active("YES");
			m.setCreated_by(1);
			matchesRepo.save(m);
		}

	}

	public Matches findByMatchId(int id) {

		Optional<Matches> t = matchesRepo.findById(id);
		return t.get();
	}

	public java.util.List<Matches> getAllMatches() {
		List<Matches> m = matchesRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		return m;
	}

	public java.util.List<Matches> getAllIncomMatches() {
		List<Matches> matches = new ArrayList<Matches>();
		List<Matches> m = matchesRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		for (Matches match : m) {
			if (match.getMatchdetails().size() < 2 && match.getIs_active().equals("YES")) {
				matches.add(match);
			}
		}
		return matches;
	}

	public void removeMatches(int id) {
		Matches m = matchesRepo.findById(id).get();
		m.setIs_active("NO");
		matchesRepo.save(m);

	}
	
	public java.util.List<Matches> getAllActiveMatches() {
		List<Matches> matches = new ArrayList<Matches>();
		List<Matches> m = matchesRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		for (Matches match : m) {
			if (match.getIs_active()=="YES") {
				matches.add(match);
			}
		}
		return matches;
	}
	
	public java.util.List<Matches> getActiveMatches() {
		List<Matches> m = matchesRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		List<Matches> matchs = new ArrayList<Matches>();
		for(Matches mat: m) {
			if(mat.getIs_active().equals("YES")) {
				matchs.add(mat);
			}
		}
		return matchs;
	}
}
