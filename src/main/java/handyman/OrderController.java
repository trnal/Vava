package handyman;

import javax.persistence.EntityManager;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import handyman.models.Order;
import handyman.repositories.OrderRepository;


@Controller
public class OrderController {
	@Autowired
	private OrderRepository orderRepository;
	
	@RequestMapping(path="/order", method = RequestMethod.GET)
    public String order(Model model) {
        return "createorder";
    }
	
	@RequestMapping(path="/order/store", method = RequestMethod.POST)
    public String store(Model model, @RequestParam("name") String name, @RequestParam("description") String description, @RequestParam("phoneNumber") String phoneNumber, @RequestParam("address") String address, @RequestParam("town") String town) {
		Order newOrder = new Order(name, description, address, phoneNumber, town);	
		orderRepository.save(newOrder);
		return "createorder";
    }
}
