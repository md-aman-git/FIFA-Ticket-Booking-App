package com.example.TicketBooking.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.model.User;
import com.example.TicketBooking.service.EmailService;
import com.example.TicketBooking.service.StadiumService;
import com.example.TicketBooking.service.UserService;

@Controller
@SessionAttributes({ "email" })
public class LoginController {

	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;

	@Autowired
	private EmailService emailService;

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/signup")
	public String signUp() {
		return "signup";
	}

	@PostMapping("/signup")
	public String signUp(User u) {
		if (userService.ValidateEmail(u.getEmail())) {
			session.setAttribute("message", "ACCOUNT ALREADY EXISTS");
			return "redirect:/signup";
		} else {
			User user = userService.saveUser(u);
			String content = emailService.getHTMLString("signupEmail");
			content = content.replace("{0}", user.getFname());
			emailService.sendMail(user.getEmail(), content);
			session.setAttribute("user", user);
			return "redirect:/";
		}

	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String ValidateLogin(Model m, String email, String pwd) {

		User user = userService.ValidateLogin(email, pwd);
		if (user != null) {
			session.setAttribute("email", email);
			session.setAttribute("user", user);
			if (user.getRole().getId() == 2) {
				return "redirect:/";
			} else {
				return "redirect:/dashboard";
			}

		} else {
			if (userService.ValidateEmail(email)) {
				m.addAttribute("msg", "Invalid userId or password");
			} else {
				m.addAttribute("msg", "Email is not registered With us !! Please Sign Up");
			}
			return "login";
		}
	}

	@GetMapping("/fpwd")
	public String forget() {
		return "fpwd";
	}

	@PostMapping("/otp")
	public String afterOTP(Model m, String email) {
		if (userService.ValidateEmail(email)) {
			session.setAttribute("temp_email", email);
			String otp = emailService.generateOtp();
			String content = emailService.getHTMLString("OTP");
			content = content.replace("{0}", otp);
			emailService.sendMail(email, content);
			session.setAttribute("otp", otp);
			return "fpwd";
		} else {
			m.addAttribute("msg", "Email is not registered With us !! Please Sign Up");
			return "fpwd";
		}

	}

	@PostMapping("/fpwd")
	public String afterforget(Model m, String password) {

		String otp = session.getAttribute("otp").toString();
		session.removeAttribute("otp");
		if (otp.equals(password)) {
			return "update_password";
		} else {
			m.addAttribute("msg", "Otp verification failed");
			return "fpwd";
		}

	}

	@GetMapping("/updatePassword")
	public String updatePassword() {
		return "update_password";
	}

	@PostMapping("/updatePassword")
	public String afterupdatePassword(Model m, String pwd) {
		if (session.getAttribute("temp_email") != null) {
			User user = userService.forgetPassword(session.getAttribute("temp_email").toString(), pwd);
			session.removeAttribute("temp_email");
			m.addAttribute("msg", "Updated Password succesfully");
			return "/login";
		} else {
			User u = (User) session.getAttribute("user");
			userService.forgetPassword(u.getEmail(), pwd);
			m.addAttribute("msg", "Updated Password succesfully");
			return "update_password";
		}
	}

	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/matches_table")
	public String matchesTable() {
		return "match_table";
	}

	@GetMapping("/blogs")
	public String getBlogs() {
		return "blog";
	}

}