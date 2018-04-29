package handyman;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import handyman.repositories.OrderRepository;
import handyman.services.OrderService;
import com.google.gson.Gson;
import handyman.models.Order;

@Controller
public class OrderController {
	private static Logger LOG = Logger.getLogger(OrderController.class.getName());
	
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(path="/order/index", method = RequestMethod.GET)
    public String index(Model model) {
		LOG.log(Level.INFO, "Zobrazenie všetkých požiadaviek od používateľov");
		List<Order> orders = orderService.getAllOrders();
		
		Gson gsonparser = new Gson();	
		String gson = gsonparser.toJson(orders);
		model.addAttribute("orders", gson);
		
		LOG.log(Level.INFO, "Ukončenie controllera pre zobrazenie požiadaviek od všetkých používateľov");
		return "order/index";
    }
	
	@RequestMapping(path="/order", method = RequestMethod.GET)
    public String order(Model model) {
		LOG.log(Level.INFO, "Otvorenie formulára s vytvorením požiadavky");
        return "order/createorder";
    }
	
	@RequestMapping(path="/order/store", method = RequestMethod.POST)
    public String store(Model model, @RequestParam("name") String name, @RequestParam("description") String description, @RequestParam("phoneNumber") String phoneNumber, @RequestParam("address") String address, @RequestParam("town") String town, @RequestParam("coordLon") Double coordLon, @RequestParam("coordLat") Double coordLat) {
		Order newOrder = new Order(name, description, address, phoneNumber, town, coordLon, coordLat);	
		LOG.log(Level.INFO, "Začiatok ukladania požiadavky do databázy");
		try {
			orderRepository.save(newOrder);
		} catch (Exception e) {
			LOG.log(Level.SEVERE, "Požiadavka nemohla byť správne uložená do databázy", e);
		}
		LOG.log(Level.INFO, "Presmerovanie na obrazovku so všetkými požiadavkami");
		return "redirect:/order/index";
    }
	
	@RequestMapping(path="/order-detail/{id}", method = RequestMethod.GET)
	public String show(Model model, @PathVariable(value = "id")Long id) {
		LOG.log(Level.INFO, "Otvorenie detailu s id " + id);
		Order order  = null;
		try {
			order = orderService.getOrderById(id);	
		} catch(Exception e) {
			LOG.log(Level.SEVERE, "Používateľa s id " + id + " sa nepodarilo vybrať z databázy", e);
		}
		
		model.addAttribute("order", order);
		return "order/showOrder";
	}
	
}
