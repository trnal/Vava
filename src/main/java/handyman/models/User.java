package handyman.models;

import javax.persistence.*;

import org.springframework.boot.autoconfigure.domain.EntityScan;

@Table(name = "users", uniqueConstraints = { @UniqueConstraint(columnNames = { "email" }) })
@Entity
public class User extends org.springframework.security.core.userdetails.User{
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private long id;
    @Column(name="nickname")
    private String nickname;
    @Column(name="email")
    private String email;
    @Column(name="password")
    private String password;
    @Column(name="abilities", length=1000)
    private String abilities;
    
    public User(String nickname, String email, String password, String abilities) {
    	this.nickname = nickname;
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

    public String getName() {
        return nickname;
    }

    public void setName(String nickname) {
        this.nickname = nickname;
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
    
    public User(String nickname, String password) {
    	this.nickname = nickname;
    	this.password = password;
    }
}