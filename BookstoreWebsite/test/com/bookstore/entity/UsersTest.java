package com.bookstore.entity;
import javax.persistence.Persistence;

import com.bookstore.entity.Users;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManager;

public class UsersTest {

	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setEmail("xun@codejava.net");
		user1.setFullName("xun xia");
		user1.setPassword("helloworld");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookstoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		
		entityManager.persist(user1);
		
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("A users object was persisted");
	}

}
