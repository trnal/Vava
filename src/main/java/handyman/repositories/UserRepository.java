package handyman.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import handyman.models.User;

public interface UserRepository extends JpaRepository<User, Long> {
	List<User> findBy(String email);

	User findByEmail(String email);
	User findByUsername(String username);
}
