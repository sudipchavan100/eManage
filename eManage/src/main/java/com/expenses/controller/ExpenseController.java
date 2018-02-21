package com.expenses.controller;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.expenses.entity.Expense;
import com.expenses.service.ExpenseService;

@Controller
public class ExpenseController {

    private static final Logger logger = Logger.getLogger(ExpenseController.class);

    public ExpenseController() {
        System.out.println("ExpenseController()");
    }
    @Autowired
    private ExpenseService expenseService;

    @RequestMapping("createExpense")
    public ModelAndView createExpense(@ModelAttribute Expense expense) {
        logger.info("Creating Expenses. Data: " +expense);
        return new ModelAndView("expenseForm");
    }

    @RequestMapping("editExpense")
    public ModelAndView editExpense(@RequestParam long id, @ModelAttribute Expense expense) throws Exception {
    	try
        {
    	logger.info("Updating the Expenses Type for the Id " +id);
        expense = expenseService.getExpense(id);
        return new ModelAndView("expenseForm", "expenseObject", expense);
        }
        catch(Exception e)
        {
           throw e;
        }
    }

    @RequestMapping("saveExpense")
    public ModelAndView saveExpense(@ModelAttribute Expense expense) throws Exception {
    	try
        {
        logger.info("Saving the Expenses Type. Data : " +expense);
        if (expense.getId() == 0) { // if expense type id is 0 then creating the expense other updating the expense
        	expenseService.createExpense(expense);
        } else {
        	expenseService.updateExpense(expense);
        }
        return new ModelAndView("redirect:getAllExpenses");
        }
        catch(Exception e)
        {
           throw e;
        }
    }

    @RequestMapping("deleteExpense")
    public ModelAndView deleteExpense(@RequestParam long id) {
        logger.info("Deleting the Expenses Type. Id : " +id);
        expenseService.deleteExpense(id);
        return new ModelAndView("redirect:getAllExpenses");
    }

    @RequestMapping(value = {"getAllExpenses", "/"})
    public ModelAndView getAllExpenses() {
        logger.info("Getting the all Expenses Type.");
        List<Expense> expenseList = expenseService.getAllExpenses();
        return new ModelAndView("expenseList", "expenseList", expenseList);
    }

    @RequestMapping("searchExpense")
    public ModelAndView searchExpense(@RequestParam("searchExpenseType") String searchExpenseType) throws Exception {
    	try
        {
        logger.info("Searching the Expenses Type. Expenses Type: " + searchExpenseType);
        List<Expense> expenseList = expenseService.getAllExpenses(searchExpenseType);
        return new ModelAndView("expenseList", "expenseList", expenseList);
        }
        catch(Exception e)
        {
           throw e;
        }

    }
}