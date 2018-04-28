package handyman.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import handyman.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
	List<User> findBy(String email);
}
