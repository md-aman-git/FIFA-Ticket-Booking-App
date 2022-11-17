package com.example.TicketBooking;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.example.TicketBooking.controller.LoginController;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class TicketBookingApplicationTests {
	@Autowired
	LoginController loginController;

	/*
	 * @Test void contextLoads() {
	 * Assertions.assertThat(loginController).isNot(null); }
	 */

}
