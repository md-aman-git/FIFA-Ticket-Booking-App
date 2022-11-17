package com.example.TicketBooking.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table
public class Block {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToMany(mappedBy = "block",fetch = FetchType.EAGER,cascade = CascadeType.ALL)	
	private Collection<Application> applications;

	private int seats;
	
	@ManyToOne
	private Stadium stadium;
	
	@CreatedBy
	private int created_by;

	@LastModifiedBy
	private int updated_by;

	@CreationTimestamp
	private Date created_at;

	@UpdateTimestamp
	private Date updated_at;

	@Column(columnDefinition = "enum('YES', 'NO')")
	public String is_active;
	
	@ManyToOne
	private Category category;
	
	private int available_seats;
}
