package handyman;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

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
		
		Gson gsonparser = new Gson();
		String gson = gsonparser.toJson(orders);
		model.addAttribute("orders", gson);
        return "order/index";
    }
	
	@RequestMapping(path="/order", method = RequestMethod.GET)
    public String order(Model model) {
        return "order/createorder";
    }
	
	@RequestMapping(path="/order/store", method = RequestMethod.POST)
    public String store(Model model, @RequestParam("name") String name, @RequestParam("description") String description, @RequestParam("phoneNumber") String phoneNumber, @RequestParam("address") String address, @RequestParam("town") String town, @RequestParam("coordLon") Double coordLon, @RequestParam("coordLat") Double coordLat) {
		Order newOrder = new Order(name, description, address, phoneNumber, town, coordLon, coordLat);	
		orderRepository.save(newOrder);
		return "redirect:/order/index";
    }
	
	@RequestMapping(path="/order-detail/{id}", method = RequestMethod.GET)
	public String show(Model model, @PathVariable(value = "id")Long id) {
		Order order = orderService.getOrderById(id);
		model.addAttribute("order", order);
		return "order/showOrder";
	}
	
}
