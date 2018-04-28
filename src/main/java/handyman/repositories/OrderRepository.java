package handyman.repositories;

import org.springframework.data.repository.CrudRepository;

import handyman.models.Order;

public interface OrderRepository extends CrudRepository<Order, Long> {

}
