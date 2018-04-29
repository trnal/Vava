package handyman;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import handyman.models.User;
import handyman.repositories.UserRepository;


@Controller
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(path="/user", method = RequestMethod.GET)
	public ResponseEntity<List<User>>  listUser(){
		return new ResponseEntity<List<User>>(getUsers(), HttpStatus.OK);
	}
	
	@RequestMapping(path="/user/{id}", method = RequestMethod.GET)
	public ResponseEntity<User>  listUser(@PathVariable(value = "id") long id){
		return new ResponseEntity<User>(getUsers().stream().filter(user -> user.getId() == id).findFirst().orElse(null), HttpStatus.OK);
		
	}
	
	@RequestMapping(path="/signup", method = RequestMethod.GET)
    public String order(Model model) {
        return "createUser";
    }
	
	@RequestMapping(path="/users/store", method = RequestMethod.POST)
    public String store(Model model, @RequestParam("nickname") String nickname, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("confirmPassword") String confirmPassword, @RequestParam("abilities") String abilities) {
		System.out.println(nickname + email + password + confirmPassword + abilities);
		if(password!=null && password.equals(confirmPassword)) {
			User newUser = new User(nickname, email, password, abilities);	
			userRepository.save(newUser);
			return "createorder";
		}
		return "createUser";
    }
	
	@RequestMapping(path="/user", method = RequestMethod.POST)
	public ResponseEntity<String>  listUser(@RequestBody User user){
		return new ResponseEntity<String>("18", HttpStatus.OK);
	}
	
	
	private List<User> getUsers() {
		return new ArrayList<User>();
	}


}