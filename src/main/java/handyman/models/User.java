package handyman.models;

import javax.persistence.*;

@Table(name = "users", uniqueConstraints = { @UniqueConstraint(columnNames = { "email" }) })
@Entity
public class User {
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private long id;
    @Column(name="username")
    private String username;
    @Column(name="email")
    private String email;
    @Column(name="password")
    private String password;
    @Column(name="abilities", length=1000)
    private String abilities;
  
    @Column(name="password_confirm")
    private String passwordConfirm;
    
    public User(String username, String email, String password, String abilities) {
    	this.username = username;
    	this.email = email;
    	this.password = password;
    	this.abilities = abilities;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getAbilities() {
        return abilities;
    }

    public void setAbilities(String abilities) {
        this.abilities = abilities;
    }
    

    public void setPassword( String password) {
    	this.password = password;
    }
    
    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }    
    
    
    public String getPassword() {
		return password;
	}


	public User() {
    }
    
    public User(String username, String password) {
    	this.username = username;
    	this.password = password;
    }
}