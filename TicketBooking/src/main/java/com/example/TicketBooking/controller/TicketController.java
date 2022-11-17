package com.example.TicketBooking.controller;

import java.text.MessageFormat;

import java.util.ArrayList;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.TicketBooking.model.Application;
import com.example.TicketBooking.model.Buyer;
import com.example.TicketBooking.model.Category;
import com.example.TicketBooking.model.Matches;
import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.model.Team;
import com.example.TicketBooking.model.Ticket;
import com.example.TicketBooking.model.User;
import com.example.TicketBooking.repository.ApplicationRepo;
import com.example.TicketBooking.repository.BuyerRepo;
import com.example.TicketBooking.repository.MatchDetailsRepo;
import com.example.TicketBooking.service.ApplicationService;
import com.example.TicketBooking.service.BlockService;
import com.example.TicketBooking.service.BuyerService;
import com.example.TicketBooking.service.CategoryService;
import com.example.TicketBooking.service.EmailService;
import com.example.TicketBooking.service.MatchDetailsService;
import com.example.TicketBooking.service.MatchesService;
import com.example.TicketBooking.service.StadiumService;
import com.example.TicketBooking.service.TeamService;
import com.example.TicketBooking.service.TicketService;
import com.example.TicketBooking.service.UserService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/tickets")
public class TicketController {
	@Autowired
	HttpSession session;

	@Autowired
	private BuyerService buyerService;

	@Autowired
	private TeamService teamService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private UserService userService;
	@Autowired
	private MatchesService matchesService;
	@Autowired
	private MatchDetailsService matchesDetailService;

	@Autowired
	private ApplicationService applicationService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private StadiumService stadiumService;

	@Autowired
	private BlockService blockService;

	@Autowired
	private TicketService ticketService;

	@GetMapping("/ticketsDashboard")
	public String ticketsDashboard() {
		return "ticketsDashboard";
	}

	@GetMapping("/applytickets")
	public String tickets(Model m) {
		String content = emailService.getHTMLString("fifa");
		List<Object[]> list = matchesDetailService.showMatche();
		List<Category> category = categoryService.getAllCategories();
		m.addAttribute("list", list);
		m.addAttribute("category", category);
		return "apply_ticket";
	}

	@PostMapping("/applytickets")
	public String afterPost(int command, Application a, String name[], int age[], int category,
			final RedirectAttributes redirectAttributes) {
		Category c = categoryService.findById(category);
		User u = (User) session.getAttribute("user");
		User u2 = userService.findById(u.getId());
		Application app = applicationService.addApplication(a, u2, c, command);
		buyerService.saveBuyersWithApplication(app, name, age);
		String content = emailService.getHTMLString("application");
		content = content.replace("{0}", u2.getFname());
		emailService.sendMail(u2.getEmail(), content);
		List<Object[]> match = matchesDetailService.showMatche(command);
		redirectAttributes.addFlashAttribute("quantity", name.length);
		redirectAttributes.addFlashAttribute("application", app);
		redirectAttributes.addFlashAttribute("match", match.get(0));
		redirectAttributes.addFlashAttribute("name", u.getFname());
		redirectAttributes.addFlashAttribute("names", name);
		redirectAttributes.addFlashAttribute("ages", age);
		redirectAttributes.addFlashAttribute("cost", (c.getPrice() * (name.length)));
		Matches matchId = matchesService.findByMatchId(command);
		blockService.fillBlock(app, matchId.getStadium().getId());
		return "redirect:/tickets/summary";

	}

	@GetMapping("/summary")
	public String summary(Model m, @ModelAttribute("cost") double cost, @ModelAttribute("name") String name,
			@ModelAttribute("match") Object[] match, @ModelAttribute("names") String names[],
			@ModelAttribute("ages") int ages[], @ModelAttribute("application") Application app,
			@ModelAttribute("quantity") int quantity) {
		m.addAttribute("match", match);
		m.addAttribute("name", name);
		m.addAttribute("names", names);
		m.addAttribute("ages", ages);
		m.addAttribute("cost", cost);
		m.addAttribute("quantity", quantity);
		m.addAttribute("application", app);
		m.addAttribute("number", app.getNo());
		return "summary";

	}

	@GetMapping("/TicketApplication")
	public String ticketApp(Model m) {
		if (session.getAttribute("user") != null) {
			User u = (User) session.getAttribute("user");
			ArrayList<Application> list = userService.getApplications(u.getId());
			m.addAttribute("list", list);
			return "TicketApplication";
		}
		return "login";
	}

	@GetMapping("/HowToApplyTicket")
	public String stepsToApply() {
		return "HowToApplyTicket";
	}

	@GetMapping("/ticketCategory")
	public String ticketCat() {
		return "ticketCategory";
	}

	@GetMapping(path = { "/viewApplications/{id}", "/viewApplications" })
	public String getApplicationView(Model m, @PathVariable("id") Optional<Integer> id) {
		if (session.getAttribute("user") != null) {
			User u2 = (User) session.getAttribute("user");
			User u = userService.findById(u2.getId());
			Application app = applicationService.findById(id.get());

			Iterator<Buyer> buy = app.getBuyers().iterator();
			String names[] = new String[app.getBuyers().size()];
			int ages[] = new int[app.getBuyers().size()];
			int i = 0;
			while (buy.hasNext()) {
				Buyer b = buy.next();
				names[i] = b.getName();
				ages[i] = b.getAge();
				i++;
			}

			List<Object[]> match = matchesDetailService.showMatche(app.getMatches_id());
			m.addAttribute("match", match.get(0));
			m.addAttribute("name", u.getFname());
			m.addAttribute("names", names);
			m.addAttribute("ages", ages);
			m.addAttribute("cost", app.getCategory().getPrice() * (app.getBuyers().size()));
			m.addAttribute("quantity", app.getBuyers().size());
			m.addAttribute("application", app);
			m.addAttribute("number", app.getNo());
			return "summary";
		}
		return "login";

	}

	@GetMapping(path = { "/payment/{id}" })
	public String getPaymentForApplication(Model m, @PathVariable("id") Optional<Integer> id) {
		try {
			Application app = applicationService.findById(id.get());
			m.addAttribute("application", app);
			m.addAttribute("total", app.getBuyers().size() * (app.getCategory().getPrice()));
			List<Object[]> match = matchesDetailService.showMatche(app.getMatches_id());
			m.addAttribute("match", match.get(0));
			m.addAttribute("quantity", app.getBuyers().size());
			return "payment";

		} catch (Exception e) {
			return "login";
		}
	}

	@PostMapping("/payment/{id}")
	public String successPayment(Model m, @PathVariable("id") Optional<Integer> id, Ticket tt) {
		Application app = applicationService.findById(id.get());
		User user = (User) session.getAttribute("user");
		applicationService.payment(tt, app, user);
		String content = emailService.getHTMLString("fifa");
		List<Object[]> match = matchesDetailService.showMatche(app.getMatches_id());
		content = content.replace("{0}", ((String) match.get(0)[1] + " \n " + (String) match.get(0)[3]));
		content = content.replace("{1}", (String.valueOf(app.getBuyers().size())));
		content = content.replace("{2}", (String.valueOf(app.getBuyers().size() * (app.getCategory().getPrice()))));
		emailService.sendMail(user.getEmail(), content);
		return "process";
	}

	@GetMapping("/viewTicket/{id}")
	public String getTicket(Model m, @PathVariable int id) {
		try {
			Ticket t = ticketService.findByApplicationId(id);
			Application app = t.getApplication();
			Set<Buyer> applications = app.getBuyers();
			Iterator<Buyer> buy = applications.iterator();
			List<Buyer> buyers = new ArrayList<Buyer>();
			while (buy.hasNext()) {
				buyers.add(buy.next());
			}
			List<Object[]> match = matchesDetailService.showMatche(app.getMatches_id());
			m.addAttribute("match", match.get(0));
			m.addAttribute("application", app);
			m.addAttribute("ticket", t);
			m.addAttribute("buyers", buyers);
			return "ticket";
		} catch (Exception e) {
			return "login";
		}

	}

}