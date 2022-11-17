package com.example.TicketBooking.service;

import com.example.TicketBooking.model.Matches;

public interface MatchesService {

	public long generateMatchesId();

	public void addMatch(Matches m, int stdid);

	public Matches findByMatchId(int id);

	public java.util.List<Matches> getAllMatches();

	public java.util.List<Matches> getAllIncomMatches();

	public void removeMatches(int id);
	
	public java.util.List<Matches> getActiveMatches() ;
	
}
