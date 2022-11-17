package com.example.TicketBooking;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner.StrictStubs;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import com.example.TicketBooking.model.Stadium;
import com.example.TicketBooking.repository.StadiumRepo;
import com.example.TicketBooking.service.serviceImpl.StadiumServiceImpl;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalTimeDeserializer;

@ExtendWith(MockitoExtension.class)
public class ServiceTests {
	@InjectMocks
	StadiumServiceImpl service;

	@Mock
	StadiumRepo stadiumRepo;

	@Test
	// Unit Testing the Service Layer
	@MockitoSettings(strictness = Strictness.WARN)
	public void testFindAllStadiums() {
		List<Stadium> list = new ArrayList<Stadium>();
		Stadium s1 = new Stadium(1, 150, "Qatar", 1, 1, new Date(), new Date(), "YES", null);
		Stadium s2 = new Stadium(2, 150, "Al thuma", 1, 1, new Date(), new Date(), "YES", null);
		Stadium s3 = new Stadium(3, 150, "Stadium", 1, 1, new Date(), new Date(), "YES", null);

		list.add(s1);
		list.add(s2);
		list.add(s3);
		list.sort((Stadium o1, Stadium o2) -> o2.getId() - o1.getId());
		when(stadiumRepo.findAll()).thenReturn(list);

		// test
		List<Stadium> stdList = service.findAllStadiums();

		assertEquals(3, stdList.size());
		verify(stadiumRepo, times(1)).findAll();
	}

}