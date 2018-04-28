package handyman;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import handyman.models.User;


@Controller
public class UserController {
	
	@RequestMapping(path="/user", method = RequestMethod.GET)
	public ResponseEntity<List<User>>  listUser(){
		return new ResponseEntity<List<User>>(getUsers(), HttpStatus.OK);
	}
	
	@RequestMapping(path="/user/{id}", method = RequestMethod.GET)
	public ResponseEntity<User>  listUser(@PathVariable(value = "id") long id){
		return new ResponseEntity<User>(getUsers().stream().filter(user -> user.getId() == id).findFirst().orElse(null), HttpStatus.OK);
		
	}
	
	@RequestMapping(path="/user", method = RequestMethod.POST)
	public ResponseEntity<String>  listUser(@RequestBody User user){
		return new ResponseEntity<String>("18", HttpStatus.OK);
	}
	
	
	private List<User> getUsers() {
		return new ArrayList<User>();
	}


}