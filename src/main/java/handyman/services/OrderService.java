package handyman.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handyman.repositories.OrderRepository;
import handyman.repositories.UserRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;
}
