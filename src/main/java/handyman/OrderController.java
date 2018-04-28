package handyman;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import handyman.models.Order;

@Controller
public class OrderController {
	@RequestMapping(path="/order", method = RequestMethod.GET)
    public String order(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        return "createorder";
    }
	
	@RequestMapping(path="/order/store", method = RequestMethod.POST)
    public String store(Model model, @RequestParam("name") String name, @RequestParam("description") String description) {
		
		return "createorder";
    }
}
