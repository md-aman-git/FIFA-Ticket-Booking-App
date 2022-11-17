package com.example.TicketBooking.controller;

import java.util.List;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.TicketBooking.model.Category;
import com.example.TicketBooking.model.Matchdetails;
import com.example.TicketBooking.model.Matches;
import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.model.Team;
import com.example.TicketBooking.service.ApplicationService;
import com.example.TicketBooking.service.BlockService;
import com.example.TicketBooking.service.CategoryService;
import com.example.TicketBooking.service.MatchDetailsService;
import com.example.TicketBooking.service.MatchesService;
import com.example.TicketBooking.service.StadiumService;
import com.example.TicketBooking.service.TeamService;
import com.example.TicketBooking.service.UserService;
import com.example.TicketBooking.service.serviceImpl.AdminServiceImpl;

@Controller
public class AdminController {

	@Autowired
	private StadiumService stadiumService;

	@Autowired
	private TeamService teamService;

	@Autowired
	private MatchesService matchesService;

	@Autowired
	private MatchDetailsService matchDetailsService;
	
	@Autowired
	private CategoryService categoryService;

	@Autowired
	HttpSession session;

	@Autowired
	AdminServiceImpl adminService;
	
	@Autowired
	BlockService blockService;

	@Autowired
	UserService userService;
	
	@Autowired
	ApplicationService applicationService;

	/* STADIUM */
	@GetMapping(path = { "/stadium", "/stadium/{id}" })
	public String stadiums(Model model, @PathVariable("id") Optional<Integer> id) {
		if (id.isPresent()) {
			Stadium st = stadiumService.findByStdId(id.get());
			model.addAttribute("id", st.getId());
			model.addAttribute("stdname", st.getStdname());
			model.addAttribute("capacity", st.getCapacity());

		} else {
			model.addAttribute("id", null);

		}
		model.addAttribute("std", stadiumService.getActiveStadium());

		return "stadium";
	}

	@PostMapping(path = { "stadium", "/stadium/{id}" })
	public String saveStadium(Stadium st) {
		stadiumService.addStadium(st);
		return "redirect:/stadium";
	}

	@GetMapping("/stadium/delete/{id}")
	public String deleteStadium(@PathVariable("id") int id) {
		stadiumService.removeStadium(id);
		return "redirect:/stadium";
	}
	/* STADIUM */

	/* TEAM */
	@GetMapping(path = { "/team", "/team/{id}" })
	public String teams(Model model, @PathVariable("id") Optional<Integer> id) {
		if (id.isPresent()) {
			Team t = teamService.findByTeamId(id.get());
			model.addAttribute("id", t.getId());
			model.addAttribute("name", t.getName());
			model.addAttribute("score", t.getScore());
			model.addAttribute("pool", t.getPool());
			model.addAttribute("level", t.getLevel());
		} else {
			model.addAttribute("id", null);

		}
		model.addAttribute("team", teamService.getAllTeams());

		return "team";
	}

	@PostMapping(path = { "/team", "/team/{id}" })
	public String saveTeam(Team t) {
		teamService.addTeam(t);
		return "redirect:/team";
	}

	@GetMapping("/team/delete/{id}")
	public String deleteTeam(@PathVariable("id") int id) {
		teamService.removeTeam(id);
		return "redirect:/team";
	}
	/* TEAM */

	/* MATCH */
	@GetMapping(path = { "/matches", "/matches/{id}" })
	public String matches(Model model, @PathVariable("id") Optional<Integer> id) {
		if (id.isPresent()) {
			Matches m = matchesService.findByMatchId(id.get());
			model.addAttribute("id", m.getId());
			model.addAttribute("stdid", m.getStadium().getId());
			model.addAttribute("stadium", stadiumService.getActiveStadium());
			model.addAttribute("schedule", m.getSchedule());

		} else {
			model.addAttribute("stadium", stadiumService.getActiveStadium());
			model.addAttribute("id", null);
		}
		model.addAttribute("mat", matchesService.getActiveMatches());
		return "matches";

	}

	@PostMapping(path = { "/matches", "/matches/{id}" })
	public String matchesAfter(Matches m, int stadium) {
		matchesService.addMatch(m, stadium);
		return "redirect:/matches";

	}

	@GetMapping("/matches/delete/{id}")
	public String deleteMatch(@PathVariable("id") int id) {
		matchesService.removeMatches(id);
		return "redirect:/matches";
	}
	/* MATCH */
	
	/* CATEGORY */
	@GetMapping(path = { "/category", "/category/{id}" })
	public String categories(Model model, @PathVariable("id") Optional<Integer> id) {
		if (id.isPresent()) {
			Category c = categoryService.findById(id.get());
			model.addAttribute("id", c.getId());
			model.addAttribute("name", c.getName());
			model.addAttribute("price", c.getPrice());

		} else {
			model.addAttribute("id", null);

		}
		model.addAttribute("cat", categoryService.getAllCategories());

		return "category";
	}
	
	@PostMapping(path = { "/category", "/category/{id}"  })
	public String saveCategory(Category cat) {
		categoryService.addCategory(cat);
		return "redirect:/category";
	}

	@GetMapping("/category/delete/{id}")
	public String deleteCategory(@PathVariable("id") int id) {
		categoryService.removeCategory(id);
		return "redirect:/category";
	}
	
	
	

	/* MATCH DETAILS */
	@GetMapping(path = { "/matchdetails", "/matchdetails/{id}" })
	public String matchDetails(Model model, @PathVariable("id") Optional<Integer> id) {
		if (id.isPresent()) {
			Matchdetails md = matchDetailsService.findByMatchDetailsId(id.get());
			model.addAttribute("id", md.getId());
			model.addAttribute("matchid", md.getMatches().getId());
			model.addAttribute("teamid", md.getTeam().getId());
			model.addAttribute("pool", md.getTeam().getPool());
			model.addAttribute("match", matchesService.getAllIncomMatches());
			model.addAttribute("team", teamService.getAllIncomTeams());
		} else {
			model.addAttribute("team", teamService.getAllIncomTeams());
			model.addAttribute("match", matchesService.getAllIncomMatches());
			model.addAttribute("id", null);
		}
		model.addAttribute("matd", matchDetailsService.getAllMatchDetailsSort());
		return "matchdetails";

	}

	@PostMapping(path = { "/matchdetails", "/matchdetails/{id}" })
	public String matchesDetails(Matchdetails m, int matches, int team) {

		matchDetailsService.addMatchDetails(m, matches, team);
		return "redirect:/matchdetails";

	}

	@GetMapping("/matchdetails/delete/{id}")
	public String deleteMatchDetails(@PathVariable("id") int id) {
		matchDetailsService.removeMatchDetails(id);
		return "redirect:/matchdetails";
	}
	/* MATCH DETAILS */
	
	/* DASHBOARD */
	@GetMapping("/dashboard")
	public String dashboard(Model m) {
		m.addAttribute("totalStadiums", stadiumService.getAllStadiums().size());
		m.addAttribute("totalTeams", teamService.getAllTeams().size());
		m.addAttribute("totalMatches", matchesService.getAllMatches().size());
		m.addAttribute("totalApplications",applicationService.getAllApplications().size());
		m.addAttribute("stadium",stadiumService.getAllStadiums());
		return "dashboard";
	}
	

	@GetMapping("/adminChngPwd")
	public String chngePwd() {
		return "adminChngPwd";
	}

	@PostMapping("/adminChngPwd")
	public String afterChangPwd(Model m, String opwd, String pwd) {
		String email = (String) session.getAttribute("email");
		if (adminService.chngePwd(email, opwd, pwd)) {
			m.addAttribute("msg","Password changed successfully");
		}
		else {
			m.addAttribute("msg","Failed! Old password doesnot match");
		}
		return "adminChngPwd";
	}
	/* DASHBOARD */
	
	@GetMapping("/application")
	public String getApplications(Model m) {
		m.addAttribute("stadium", stadiumService.getAllStadiums());
		m.addAttribute("application", applicationService.getAllApplications());
		m.addAttribute("matches", matchesService.getAllMatches());
		return "applications";
	}
	
	@PostMapping("/application")
	public String postApplications(Model m,int stadium,int match) {
		blockService.sellTickets(stadium,match);
		return "redirect:/application";
		
	}

}
