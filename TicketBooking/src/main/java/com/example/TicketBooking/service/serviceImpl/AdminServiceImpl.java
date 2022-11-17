package com.example.TicketBooking.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.User;
import com.example.TicketBooking.repository.UserRepo;
import com.example.TicketBooking.service.AdminService;
import com.example.TicketBooking.service.UserService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	UserRepo userRepo;

	@Autowired
	UserService userService;

	@Override
	public boolean chngePwd(String email, String opwd, String pwd) {
		User u = userRepo.findByEmail(email);
		
		if (u.getRole().getId() == 1) {
			if (u.getPwd().equals(opwd)) {
				u.setPwd(pwd);
				u.setUpdated_by(1);
				userRepo.save(u);
				return true;
			}
		}
		return false;
	}

}