package com.bookstore.entity;
import javax.persistence.Persistence;

import com.bookstore.entity.Users;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManager;

public class CategoryTest {

	public static void main(String[] args) {
		Category newCat = new Category("Core Java");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookstoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		
		entityManager.persist(newCat);
		
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("A Category object was persisted");
	}

}
