package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOTest{
	private static BookDAO bookDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDao = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDao.close();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Effective Java");
		category.setCategoryId(2);
		newBook.setCategory(category);
		
		newBook.setTitle("Effective Java (2nd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		newBook.setPublishDate(publishDate);
		
		String imagePath = "/Users/xiaxun/Downloads/bookstore\\ website\\ project/books/Effective\\ Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDao.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testCreate2Book() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Covers Spring");
		category.setCategoryId(1);
		newBook.setCategory(category);
		
		newBook.setTitle("Spring in Action: Covers Spring 4");
		newBook.setAuthor("Craig Walls");
		newBook.setDescription("Spring in Action, Fourth Edition is a hands-on guide to the Spring Framework.");
		newBook.setPrice(33.99f);
		newBook.setIsbn("161729120X");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("11/28/2014");
		newBook.setPublishDate(publishDate);
		
		String imagePath = "/Users/xiaxun/Downloads/bookstore\\ website\\ project/books/Spring\\ in\\ Action.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDao.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testUpdateeBook() throws ParseException, IOException {
		Book existBook = new Book();
		existBook.setBookId(1);
		
		Category category = new Category("Java Core");
		category.setCategoryId(1);
		existBook.setCategory(category);
		
		existBook.setTitle("Effective Java (3rd Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		existBook.setPrice(40f);
		existBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		existBook.setPublishDate(publishDate);
		
		String imagePath = "/Users/xiaxun/Downloads/bookstore\\ website\\ project/books/Effective\\ Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(imageBytes);
		
		Book updatedBook = bookDao.update(existBook);
		
		assertEquals(updatedBook.getTitle(), "Effective Java (3rd Edition");
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 1;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testGetBookFail() {
		Integer bookId = 99;
		Book book = bookDao.get(bookId);
		
		assertNull(book);
	}
	
	@Test
	public void testGetBookSuccess() {
		Integer bookId = 2;
		Book book = bookDao.get(bookId);
		
		assertNotNull(book);
	} 
	
	@Test
	public void testLitAll() {
		List<Book> listBooks = bookDao.listAll();
		
		for (Book aBook : listBooks) {
			System.out.println(aBook.getTitle() + " - " + aBook.getAuthor());
		}
		assertFalse(listBooks.isEmpty());		
	}
	
	@Test
	public void testFindByTitleNotExist() {
		String title = "Think in Java";
		Book book = bookDao.findByTitle(title);
		
		assertNull(book);
	}
	
	@Test
	public void testFindByTitleExist() {
		String title = "Spring in Action: Covers Spring 4";
		Book book = bookDao.findByTitle(title);
		
		System.out.println(book.getAuthor());
		System.out.println(book.getPrice());
		
		assertNotNull(book);
	}
	
	@Test
	public void testCount() {
		long totalBooks = bookDao.count();
		
		assertEquals(totalBooks, 2);
	}
	
	@Test
	public void testListNewBooks() {
		List<Book> listNewBooks = bookDao.listNewBooks();
		for (Book aBook : listNewBooks) {
			System.out.println(aBook.getTitle() + " - " + aBook.getPublishDate());
		}
		assertEquals(listNewBooks.size(), 4);
	}
	
	@Test
	public void testListByCategory() {
		int categoryId = 1;
		
		List<Book> listBooks = bookDao.listByCategory(categoryId);
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testSearchBookInTitle() {
		String keyword = "Java";
		List<Book> result = bookDao.search(keyword);
		
		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(7, result.size());
	}
	
	@Test
	public void testSearchBookInAuthor() {
		String keyword = "Kathy";
		List<Book> result = bookDao.search(keyword);
		
		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(2, result.size());
	}
	
	@Test
	public void testSearchBookInDescription() {
		String keyword = "The big picture";
		List<Book> result = bookDao.search(keyword);
		
		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testCountByCategory() {
		int categoryId = 4;
		long numOfBooks = bookDao.countByCategory(categoryId);
		
		assertEquals(numOfBooks, 5);
	}
	
	@Test
	public void testListBestSellingBooks() {
		List<Book> topBestSellingBooks = bookDao.listBestSellingBooks();
		
		for (Book book : topBestSellingBooks) {
			System.out.println(book.getTitle());
		}
		
		assertEquals(4, topBestSellingBooks.size());
	}
	
	@Test
	public void testMostFavoredBooks() {
		List<Book> topFavoredBooks = bookDao.listMostFavoredBooks();
		
		for (Book book : topFavoredBooks) {
			System.out.println(book.getTitle());
		}
		
		assertEquals(4, topFavoredBooks.size());
	}
	

}
