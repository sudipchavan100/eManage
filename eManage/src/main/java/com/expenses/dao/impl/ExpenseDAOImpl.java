package com.expenses.dao.impl;

import com.expenses.dao.ExpenseDAO;
import com.expenses.entity.Expense;
import com.expenses.util.HibernateUtil;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class ExpenseDAOImpl implements ExpenseDAO {

	public ExpenseDAOImpl(){
		System.out.println("ExpensesDAOImpl");
	}

	@Autowired
    private HibernateUtil hibernateUtil;

	@Override
	public long createExpense(Expense expense) {
		return (long) hibernateUtil.create(expense);
	}

	@Override
	public Expense updateExpense(Expense expense) {
		return hibernateUtil.update(expense);
	}

	@Override
	public void deleteExpense(long id) {
		Expense expense = new Expense();
		expense.setId(id);
		hibernateUtil.delete(expense);
	}

	@Override
	public List<Expense> getAllExpenses() {
		return hibernateUtil.fetchAll(Expense.class);
	}

	@Override
	public Expense getExpense(long id) {
		return hibernateUtil.fetchById(id, Expense.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Expense> getAllExpenses(String expenseCategoryType) {
		String query = "SELECT e.* FROM Expenses e WHERE e.categoryType like '%"+ expenseCategoryType +"%'";
		List<Object[]> expenseObjects = hibernateUtil.fetchAll(query);
		List<Expense> expenses = new ArrayList<Expense>();
		for (Object[] expenseObject: expenseObjects){
			Expense expense = new Expense();
			long id = ((BigInteger)expenseObject[0]).longValue();
			String categoryType = (String) expenseObject[2];
			String transactionType = (String) expenseObject[4];
			Date purchaseDate = (Date) expenseObject[1];
			double amount = (double)expenseObject[3];
			
			expense.setId(id);
			expense.setCategoryType(categoryType);
			expense.setTransactionType(transactionType);
			expense.setPurchaseDate(purchaseDate);
			expense.setAmount(amount);
			expenses.add(expense);
			
		}
		System.out.println(expenses);
		return expenses;
	}
}
