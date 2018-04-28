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
