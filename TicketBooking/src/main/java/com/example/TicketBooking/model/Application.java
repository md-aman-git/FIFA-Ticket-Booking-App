package com.example.TicketBooking.model;

import java.util.Date;
import java.util.Set;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table
@Getter
@Setter
public class Application {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	private User user;

	@OneToMany(mappedBy = "application",fetch = FetchType.EAGER)
	private Set<Buyer> buyers;

	@CreatedBy
	private Integer created_by;

	@LastModifiedBy
	private Integer updated_by;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date created_at;

	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date updated_at;

	@Column(columnDefinition = "enum('YES', 'NO')")
	public String is_active;
	
	@ManyToOne
	private Category category;
	
	private int matches_id;
	
	@Column(columnDefinition = "enum('InProgress','Payment Pending', 'Rejected','Completed')")
	public String status;
	
	private String no;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private Block block;
}
