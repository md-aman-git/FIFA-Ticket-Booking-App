package com.example.TicketBooking.service.serviceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.*;
import com.example.TicketBooking.repository.EmailRepo;
import com.example.TicketBooking.repository.UserRepo;
import com.example.TicketBooking.service.EmailService;
import com.example.TicketBooking.service.RoleService;
import com.example.TicketBooking.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepo userRepo;
	@Autowired
	EmailService emailService;
	@Autowired
	RoleService roleService;

	public User saveUser(User u) {
		// emailService.sendMail(u.getEmail());
		u.setIs_active("YES");
		u.setCreated_by(2);
		Role r = roleService.findById(2);
		u.setRole(r);
		u.setUpdated_by(2);
		return userRepo.save(u);
	}

	public User forgetPassword(String email, String pwd) {
		User u = userRepo.findByEmail(email);
		if (u != null) {
			u.setPwd(pwd);
			u.setUpdated_by(2);
			userRepo.save(u);
			return u;
		} else {
			return null;
		}
	}

	public User ValidateLogin(String email, String pwd) {
		User u = userRepo.findByEmail(email);
		try {
			if (u.getPwd().equals(pwd))
				return u;
			else
				return null;
		} catch (Exception e) {
			return null;
		}
	}

	public boolean ValidateEmail(String email) {
		if (userRepo.findByEmail(email) != null) {
			return true;
		} else
			return false;
	}

	public User findById(int id) {
		return userRepo.findById(id).get();
	}

	public ArrayList<Application> getApplications(int id) {
		User u = userRepo.findById(id).get();
		Iterator<Application> ir = u.getApplications().iterator();
		ArrayList<Application> list = new ArrayList<Application>();
		while (ir.hasNext()) {
			Application a = ir.next();
			list.add(a);

		}
		if (list.size() > 0) {
			list.sort((Application a, Application b) -> a.getCreated_at().compareTo(b.getCreated_at()));
		}
		return list;
	}

}
