package handyman.services;

import handyman.models.User;

public interface UserService {
	
    void save(User user);

    User findByUsername(String username);
}