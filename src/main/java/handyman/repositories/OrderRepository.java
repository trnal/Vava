package handyman.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import handyman.models.Order;

public interface OrderRepository extends CrudRepository<Order, Long> {
	List<Order> findAll(); 
}
