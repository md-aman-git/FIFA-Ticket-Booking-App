package com.example.TicketBooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.TicketBooking.model.Matchdetails;
import java.util.List;

@Repository
public interface MatchDetailsRepo extends JpaRepository<Matchdetails, Integer> {

	Matchdetails findFirstByOrderByIdDesc();

	@Query(nativeQuery = true, value = "select m.matches_id,mt.schedule ,s.stdname , group_concat(t.name  separator ' vs ') from matchdetails m join team t on m.team_id=t.id join matches mt on mt.id = m.matches_id join stadium s on s.id=mt.stadium_id group by matches_id;")
	public List<Object[]> showMatches();

	@Query(nativeQuery = true, value = "select m.matches_id,mt.schedule ,s.stdname , group_concat(t.name  separator ' vs ') from matchdetails m join team t on m.team_id=t.id join matches mt on mt.id = m.matches_id join stadium s on s.id=mt.stadium_id  where mt.id=?1 group by matches_id ")
	List<Object[]> retrieveMatch(int match_id);
}
