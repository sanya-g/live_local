package com.example.demo.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document(collection = "Users")
public class User {

    @Id
    private String id;

    private String firstName;

    private String lastName;

    private  String location;

    private List<Post> postsIds;

    @DBRef
    private List<Business> businessesIds;

    public User(String firstName, String lastName, String location) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.location = location;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<Business> getBusinessesIds() {
        return businessesIds;
    }

    public void setBusinessesIds(List<Business> businessesIds) {
        this.businessesIds = businessesIds;
    }

    public List<Post> getPostsIds() {
        return postsIds;
    }

    public void setPostsIds(List<Post> postsIds) {
        this.postsIds = postsIds;
    }
}
