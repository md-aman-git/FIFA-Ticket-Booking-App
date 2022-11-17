package com.example.TicketBooking.service;

import java.util.List;

import com.example.TicketBooking.model.Matchdetails;

public interface MatchDetailsService {

	public long generateMatchDetailsId();

	public void addMatchDetails(Matchdetails md, int matchid, int teamid);

	public Matchdetails findByMatchDetailsId(int id);

	public List<Matchdetails> getAllMatchDetails();

	public List<Matchdetails> getAllMatchDetailsSort();

	public void removeMatchDetails(int id);

	public List<Object[]> showMatche();

	public List<Object[]> showMatche(int match_id);

}
