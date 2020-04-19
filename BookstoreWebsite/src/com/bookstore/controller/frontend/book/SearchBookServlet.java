package com.bookstore.controller.frontend.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookServices;

@WebServlet("/search")
public class SearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchBookServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response) 
			throws ServletException, IOException {
		BookServices bookServices = new BookServices( requset, response);
		bookServices.search();
	}

}
