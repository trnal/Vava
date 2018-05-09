package handyman.models;

import javax.persistence.*;

@Table(name = "orders")
@Entity
public class Order {
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
    private long id;
	@Column(name="user_id")
    private long userId;
	@Column(name="name")
    private String name;
	@Column(name="description")
    private String description;
	@Column(name="address")
	private String address;
	@Column(name="town")
	private String town;
	@Column(name="phone_number")
	private String phoneNumber;
	@Column(name="coord_lon")
	private double coordLon;
	@Column(name="coord_lat")
	private double coordLat;
	
	public Order() {}
	
	public Order(Long userId, String name, String description, String address, String phoneNumber, String town, double coordLon, double coordLat) {
		this.name = name;
		this.description = description;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.town = town;
		this.coordLon = coordLon;
		this.coordLat = coordLat;
		this.userId = userId;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getAddress() {
		return address;
	};
	
	public String getTown() {
		return town;
	};
	
	public String getPhoneNumber() {
		return town;
	};
	
	public Double getCoordLon() {
		return coordLat;
	};
	
	public Double getCoordLat() {
		return coordLat;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	};
	
	
}