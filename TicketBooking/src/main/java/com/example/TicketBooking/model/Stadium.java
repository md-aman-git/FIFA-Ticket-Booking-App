package com.example.TicketBooking.model;

import java.util.Date;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Stadium {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private int capacity;
	
	@Column()
	private String stdname;
	
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
	
	@OneToMany(mappedBy = "stadium",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@MapKey(name = "id")
	private Map<Integer,Block> blocks;
	
	
}
