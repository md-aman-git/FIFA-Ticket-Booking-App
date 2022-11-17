package com.example.TicketBooking.service;

import java.util.List;

import com.example.TicketBooking.model.Team;

public interface TeamService {

	public java.util.List<Team> getAllTeams();

	public void addTeam(Team t);

	public Team findByTeamId(int id);

	public long generateTeamId();

	public long totalTeam();

	public void removeTeam(int id);

	public List<Team> findAllByPool(String pool);

	public java.util.List<Team> getAllIncomTeams();

}
