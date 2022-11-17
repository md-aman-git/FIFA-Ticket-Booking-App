package com.example.TicketBooking.service.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Matchdetails;
import com.example.TicketBooking.model.Matches;
import com.example.TicketBooking.model.Team;
import com.example.TicketBooking.repository.MatchDetailsRepo;
import com.example.TicketBooking.repository.TeamRepo;
import com.example.TicketBooking.service.MatchDetailsService;
import com.example.TicketBooking.service.MatchesService;
import com.example.TicketBooking.service.TeamService;

@Service
public class MatchDetailsServiceImpl implements MatchDetailsService{

	@Autowired
	MatchDetailsRepo matchDetailsRepo;

	@Autowired
	MatchesService matchesService;

	@Autowired
	TeamService teamService;

	@Autowired
	TeamRepo teamRepo;

	public long generateMatchDetailsId() {
		int count = 0;
		try {
			count = matchDetailsRepo.findFirstByOrderByIdDesc().getId();
		} catch (Exception e) {

			count = 0;
		}
		return count + 1;
	}

	public void addMatchDetails(Matchdetails md, int matchid, int teamid) {
		if (matchDetailsRepo.existsById(md.getId())) {
			Matches match = matchesService.findByMatchId(matchid);
			Team team = teamService.findByTeamId(teamid);
			Matchdetails matchDetails = matchDetailsRepo.findById(md.getId()).get();
			matchDetails.setMatches(match);
			matchDetails.setTeam(team);
			matchDetails.setUpdated_by(1);
			matchDetailsRepo.save(matchDetails);
		} else {
			Matches match = matchesService.findByMatchId(matchid);
			Team team = teamService.findByTeamId(teamid);
			md.setCreated_by(1);
			md.setIs_active("YES");
			md.setMatches(match);
			team.setIs_active("NO");
			team.setUpdated_by(1);
			teamRepo.save(team);
			md.setTeam(team);
			matchDetailsRepo.save(md);
		}

	}

	public Matchdetails findByMatchDetailsId(int id) {

		Optional<Matchdetails> mat = matchDetailsRepo.findById(id);
		return mat.get();

	}

	public List<Matchdetails> getAllMatchDetails() {
		List<Matchdetails> m = matchDetailsRepo.findAll(Sort.by(Sort.Direction.DESC, "id"));
		return m;
	}

	public List<Matchdetails> getAllMatchDetailsSort() {
		List<Matchdetails> m = matchDetailsRepo.findAll(Sort.by(Sort.Direction.ASC, "matches_id"));
		return m;
	}

	public void removeMatchDetails(int id) {
		Matchdetails matchDetails = matchDetailsRepo.findById(id).get();
		Team team = teamService.findByTeamId(matchDetails.getTeam().getId());
		team.setIs_active("YES");
		team.setUpdated_by(1);
		teamRepo.save(team);
		matchDetailsRepo.deleteById(id);
	}

	public List<Object[]> showMatche() {
		List<Object[]> list = matchDetailsRepo.showMatches();
		return list;
	}

	public List<Object[]> showMatche(int match_id) {
		List<Object[]> list = matchDetailsRepo.retrieveMatch(match_id);
		return list;
	}
	
	
}
