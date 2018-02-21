package com.expenses.service.impl;

import com.expenses.dao.ExpenseDAO;
import com.expenses.entity.Expense;
import com.expenses.service.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ExpenseServiceImpl implements ExpenseService {

	public ExpenseServiceImpl(){
		System.out.println("ExpenseServiceImpl");
	}
	@Autowired
	private ExpenseDAO expenseDAO;

	@Override
	public long createExpense(Expense expense) {
		return expenseDAO.createExpense(expense);
	}

	@Override
	public Expense updateExpense(Expense expense) {
		return expenseDAO.updateExpense(expense);
	}

	@Override
	public void deleteExpense(long id) {
		expenseDAO.deleteExpense(id);
	}

	@Override
	public List<Expense> getAllExpenses() {
		return expenseDAO.getAllExpenses();
	}

	@Override
	public Expense getExpense(long id) {
		return expenseDAO.getExpense(id);
	}

	@Override
	public List<Expense> getAllExpenses(String expenseCategoryType) {
		return expenseDAO.getAllExpenses(expenseCategoryType);
	}

}
