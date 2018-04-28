package handyman.models;

import javax.persistence.*;

@Table(name = "orders")
@Entity
public class Order {
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private long id;
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
	private double coord_lon;
	@Column(name="coord_lat")
	private double coord_lat;
	
	public Order() {}
	
	public Order(String name, String description, String address, String phoneNumber, String town, double coordLon, double coordLat) {
		this.name = name;
		this.description = description;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.town = town;
		this.coord_lon = coordLon;
		this.coord_lat = coordLat;
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
}
