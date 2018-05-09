package handyman;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
	
	@PostMapping(path="/order")
    public String storeOrder(@RequestParam("name") String name, @RequestParam("categoryId") Double categoryId, 
    		@RequestParam("description") String description, @RequestParam("phoneNumber") String phoneNumber, 
    		@RequestParam("address") String address, @RequestParam("town") String town, 
    		@RequestParam("coordLon") Double coordLon, @RequestParam("coordLat") Double coordLat, Model model)
	{
		//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		//User user = (User) authentication.getPrincipal();
		
		//LOG.log(Level.INFO, "Používateľ s id " + user. + "ukladá požiadavku do databázy");
		Order newOrder = new Order(/*user.getId(), */name, description, address, phoneNumber, town, coordLon, coordLat);	
		try {
			orderRepository.save(newOrder);
		} catch (Exception e) {
			LOG.log(Level.SEVERE, "Požiadavka nemohla byť správne uložená do databázy", e);
		}
		LOG.log(Level.INFO, "Presmerovanie na obrazovku so všetkými požiadavkami");
		return "redirect:/order/index";
    }
	
	@GetMapping(path="/order/data")
    public ResponseEntity<?> getOnHoverData(@RequestParam("orderid") Long orderId) {
		LOG.log(Level.INFO, "OnHover bol spusteny nad id " + orderId);
		Order order = null;
		try {
			order = orderRepository.findOne(orderId);
		} catch (Exception e) {
			LOG.log(Level.SEVERE, "Požadovaná požiadavka sa nepodarila nájsť v databáze", e);
		}
		LOG.log(Level.INFO, "OnHover prebehol úspešne");
		return ResponseEntity.ok(order.getName() + "<br>" + order.getTown() + "<br>" + order.getAddress());
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
