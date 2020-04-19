package com.bookstore.entity;
// Generated 2020-3-27 17:50:35 by Hibernate Tools 5.2.12.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name = "customer", catalog = "bookstoredb", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
@NamedQueries({
	@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c ORDER BY c.registerDate DESC"),
	@NamedQuery(name="Customer.countAll", query="SELECT COUNT(c.email) FROM Customer c"),
	@NamedQuery(name="Customer.findByEmail", query="SELECT c FROM Customer c WHERE c.email = :email"),
	@NamedQuery(name="Customer.checkLogin", query="SELECT c FROM Customer c WHERE c.email = :email AND c.password = :pass")
})
public class Customer implements java.io.Serializable {

	private Integer customerId;
	private String email;
	private String firstname;
	private String lastname;
	private String addressLine1;
	private String addressLine2;
	private String city;
	private String state;
	private String country;
	private String phone;
	private String zipcode;
	private String password;
	private Date registerDate;
	private Set<Review> reviews = new HashSet<Review>(0);
	private Set<BookOrder> bookOrders = new HashSet<BookOrder>(0);

	public Customer() {
	}

	public Customer(String email, String firstname, String lastname, String address1, String address2, String city, String state, String country, String phone,
			String zipcode, String password, Date registerDate) {
		this.email = email;
		this.firstname = firstname;
		this.lastname = lastname;
		this.addressLine1 = address1;
		this.addressLine2 = address2;
		this.city = city;
		this.state = state;
		this.country = country;
		this.phone = phone;
		this.zipcode = zipcode;
		this.password = password;
		this.registerDate = registerDate;
	}

	public Customer(String email, String firstname, String lastname, String address1, String address2, String city, String state, String country, String phone,
			String zipcode, String password, Date registerDate, Set<Review> reviews, Set<BookOrder> bookOrders) {
		this(email,firstname,lastname, address1, address2, city, state, country, phone, zipcode, password, registerDate);
		this.reviews = reviews;
		this.bookOrders = bookOrders;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "customer_id", unique = true, nullable = false)
	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	@Column(name = "email", unique = true, nullable = false, length = 64)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "firstname", nullable = false, length = 30)
	public String getFirstname() {
		return this.firstname;
	}
	
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	@Transient
	public String getFullname() {
		return this.firstname + " " + this.lastname;
	}
	
	@Column(name = "lastname", nullable = false, length = 30)
	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	@Column(name = "address_line1", nullable = false, length = 128)
	public String getAddressLine1() {
		return this.addressLine1;
	}

	public void setAddressLine1(String address1) {
		this.addressLine1 = address1;
	}
	
	@Column(name = "address_line2", nullable = false, length = 128)
	public String getAddressLine2() {
		return this.addressLine2;
	}

	public void setAddressLine2(String address2) {
		this.addressLine2 = address2;
	}

	@Column(name = "city", nullable = false, length = 32)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name = "state", nullable = false, length = 45)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "country", nullable = false, length = 4)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	@Transient
	public String getCountryName() {
		return new Locale("", this.country).getDisplayCountry();
	}

	@Column(name = "phone", nullable = false, length = 15)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "zipcode", nullable = false, length = 24)
	public String getZipcode() {
		return this.zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	@Column(name = "password", nullable = false, length = 16)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "register_date", nullable = false, length = 19)
	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Review> getReviews() {
		return this.reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<BookOrder> getBookOrders() {
		return this.bookOrders;
	}

	public void setBookOrders(Set<BookOrder> bookOrders) {
		this.bookOrders = bookOrders;
	}

}
