package com.example.TicketBooking;

import java.time.LocalDate;
import java.util.Date;
import java.util.Optional;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.example.TicketBooking.model.User;
import com.example.TicketBooking.repository.UserRepo;

@ExtendWith(SpringExtension.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class RepoTests {

	@Autowired
	UserRepo userRepo;

	@Test
	public void testCreateReadDelete() {
		User user = new User(1, "fname", "lname", LocalDate.MAX, 99898978997l, "a@g.com", "abcd", 0, 0, new Date(),
				new Date(), "YES", null, null);

		userRepo.save(user);

		Optional<User> res = userRepo.findById(1);
		Assertions.assertThat(res.get().getFname().equalsIgnoreCase("fname"));

	}
}