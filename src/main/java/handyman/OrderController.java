package handyman;

import java.util.List;

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
import handyman.services.OrderService;


@Controller
public class OrderController {
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(path="/order/index", method = RequestMethod.GET)
    public String index(Model model) {
		List<Order> orders = orderService.getAllOrders();
		model.addAttribute("orders", orders);
        return "order/index";
    }
	
	@RequestMapping(path="/order", method = RequestMethod.GET)
    public String order(Model model) {
        return "createorder";
    }
	
	@RequestMapping(path="/order/store", method = RequestMethod.POST)
    public String store(Model model, @RequestParam("name") String name, @RequestParam("description") String description, @RequestParam("phoneNumber") String phoneNumber, @RequestParam("address") String address, @RequestParam("town") String town, @RequestParam("coord-long") Double coordLong, @RequestParam("coord-lat") Double coordLat) {
		Order newOrder = new Order(name, description, address, phoneNumber, town, coordLat, coordLong);	
		orderRepository.save(newOrder);
		return "createorder";
    }
}
