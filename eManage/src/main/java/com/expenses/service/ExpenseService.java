package com.expenses.service;

import com.expenses.entity.Expense;

import java.util.List;

public interface ExpenseService {
    public long createExpense(Expense expense);
    public Expense updateExpense(Expense expense);
    public void deleteExpense(long id);
    public List<Expense> getAllExpenses();
    public Expense getExpense(long id);
    public List<Expense> getAllExpenses(String expenseCategoryType);
}
