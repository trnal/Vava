package handyman;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import handyman.models.User;
import handyman.repositories.UserRepository;
import handyman.services.SecurityService;
import handyman.services.UserService;


@Controller
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
    private UserService userService;
    @Autowired
    private SecurityService securityService;
	
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }
    
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }
	
	@RequestMapping(path="/signup", method = RequestMethod.GET)
    public String signup(Model model) {
		model.addAttribute("userForm", new User());
        return "createUser";
    }
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username or password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
	
	
	@RequestMapping(path="/users/store", method = RequestMethod.POST)
    public String store(Model model, @RequestParam("nickname") String nickname, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("confirmPassword") String confirmPassword, @RequestParam("abilities") String abilities) {
		System.out.println(nickname + email + password + confirmPassword + abilities);
		if(password!=null && password.equals(confirmPassword)) {
			User newUser = new User(nickname, email, password, abilities);	
			userRepository.save(newUser);
			return "userProfile";
		}
		return "createUser";
    }
	
	@RequestMapping(path="/user", method = RequestMethod.POST)
	public ResponseEntity<String>  listUser(@RequestBody User user){
		return new ResponseEntity<String>("18", HttpStatus.OK);
	}
	
	@RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
}