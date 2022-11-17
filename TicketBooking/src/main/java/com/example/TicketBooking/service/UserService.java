package com.example.TicketBooking.service;

import java.util.ArrayList;
import java.util.List;

import com.example.TicketBooking.model.*;

public interface UserService {

	public User saveUser(User u);

	public User forgetPassword(String email, String pwd);

	public User ValidateLogin(String email, String pwd);

	public boolean ValidateEmail(String email);

	public User findById(int id);
	
	public ArrayList<Application> getApplications(int id) ;

}
