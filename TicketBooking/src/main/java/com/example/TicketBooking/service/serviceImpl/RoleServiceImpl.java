package com.example.TicketBooking.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.TicketBooking.model.Role;
import com.example.TicketBooking.repository.RoleRepo;
import com.example.TicketBooking.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	RoleRepo roleRepo;

	public Role findById(int id) {
		return roleRepo.findById(id).get();

	}

}
