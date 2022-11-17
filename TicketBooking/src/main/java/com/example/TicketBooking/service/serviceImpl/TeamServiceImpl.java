package com.example.TicketBooking.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Team;
import com.example.TicketBooking.repository.TeamRepo;
import com.example.TicketBooking.service.TeamService;

@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	TeamRepo teamRepo;

	public java.util.List<Team> getAllTeams() {
		return teamRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
	}

	public void addTeam(Team t) {
		if (teamRepo.existsById(t.getId())) {
			Team team = teamRepo.findById(t.getId()).get();
			team.setScore(t.getScore());
			team.setLevel(t.getLevel());
			team.setName(t.getName());
			team.setPool(t.getPool());
			team.setUpdated_by(1);
			teamRepo.save(team);
		} else {
			t.setCreated_by(1);
			t.setIs_active("YES");
			teamRepo.save(t);
		}
	}

	public Team findByTeamId(int id) {
		Optional<Team> t = teamRepo.findById(id);
		return t.get();
	}

	public long generateTeamId() {
		int count = 0;
		try {
			count = teamRepo.findFirstByOrderByIdDesc().getId();
		} catch (Exception e) {

			count = 0;
		}
		return count + 1;
	}

	public long totalTeam() {
		return teamRepo.count();
	}

	public void removeTeam(int id) {
		teamRepo.deleteById(id);
	}

	public List<Team> findAllByPool(String pool) {
		return teamRepo.findAllByPool(pool);
	}

	public java.util.List<Team> getAllIncomTeams() {
		List<Team> teams = new ArrayList<Team>();
		List<Team> list = teamRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		for (Team t : list) {
			if (t.getIs_active().equals("YES")) {
				teams.add(t);
			}
		}
		return teams;
	}

}
