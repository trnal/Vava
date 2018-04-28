package handyman.models;

import javax.persistence.*;

import org.springframework.boot.autoconfigure.domain.EntityScan;

@Table(name = "users", uniqueConstraints = { @UniqueConstraint(columnNames = { "email" }) })
@Entity
public class User {
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
    

    public void setPassword( String password) {
    	this.password = password;
    }
    
    public User(String nickname, String password) {
    	this.nickname = nickname;
    	this.password = password;
    }
}