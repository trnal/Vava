package handyman;

import java.util.logging.Level;
import java.util.logging.Logger;

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
	private static Logger LOG = Logger.getLogger(OrderController.class.getName());
	
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
    
    @PostMapping("registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
    	LOG.log(Level.INFO, "Používateľ zadal požiadavku na registráciu");
    	
        if (bindingResult.hasErrors()) {
            LOG.log(Level.INFO, "Registrácia prebehla s chybami");
            return "redirect:/registration";
        }

        try {
            userService.save(userForm);
            securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());        	
        } catch(Exception e) {
        	LOG.log(Level.INFO, "Používateľ nemohol byť vytvorený");
        	return "redirect:/registration";
        }

        LOG.log(Level.INFO, "Registrácia prebehla vporiadku");
        return "redirect:/login";
    }
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username or password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
	
	
}