package com.example.demo;

import com.example.demo.domain.Business;
import com.example.demo.domain.Post;
import com.example.demo.domain.User;
import com.example.demo.repository.BusinessRepository;
import com.example.demo.repository.PostRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class DbSeeder implements CommandLineRunner {

    private BusinessRepository businessRepository;
    private UserRepository userRepository;
    private PostRepository postRepository;

    public DbSeeder(BusinessRepository businessRepository, UserRepository userRepository, PostRepository postRepository) {
        this.businessRepository = businessRepository;
        this.userRepository = userRepository;
        this.postRepository = postRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        Business firstBusiness = new Business(
                "Oscar",
                "Adams, MN");
        Business secondBusiness = new Business(
                "Oscar",
                "Morocco, IN");

        User firstUser = new User(
                "John",
                "Ram",
                "Kansas City, MO"
        );

        User secondUser = new User(
                "Peter",
                "Burrow",
                "Denver, CO"
        );

        Post firstPost = new Post(
                "First post ever wow!",
                "https://cdn.pixabay.com/photo/2017/06/17/13/15/local-seller-2412205_960_720.jpg"
        );

        Post secondPost = new Post(
                "Second post!!!",
                "https://cdn.pixabay.com/photo/2016/01/19/15/05/coffee-shop-1149155_960_720.jpg"
        );

        this.businessRepository.deleteAll();
        this.userRepository.deleteAll();
        this.postRepository.deleteAll();

        this.businessRepository.save(firstBusiness);
        this.businessRepository.save(secondBusiness);

        this.userRepository.save(firstUser);
        this.userRepository.save(secondUser);

        this.postRepository.save(firstPost);
        this.postRepository.save(secondPost);
    }
}
