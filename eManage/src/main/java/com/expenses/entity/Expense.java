package com.expenses.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "expenses")
public class Expense implements Serializable {
	
	private static final long serialVersionUID = -7988799579036225137L;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long Id;
    
    @Column
    private String CategoryType;
    
    @Column
    private String TransactionType;
    
    @Column
    private Date PurchaseDate;
    
    @Column
    private Double Amount;

    public long getId() {
        return Id;
    }

    public void setId(long id) {
        Id = id;
    }

    public String getCategoryType() {
        return CategoryType;
    }

    public void setCategoryType(String categoryType) {
        CategoryType = categoryType;
    }

    public String getTransactionType() {
		return TransactionType;
	}

	public void setTransactionType(String transactionType) {
		TransactionType = transactionType;
	}

	public Date getPurchaseDate() {
		return PurchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		PurchaseDate = purchaseDate;
	}

	public Double getAmount() {
		return Amount;
	}

	public void setAmount(Double amount) {
		Amount = amount;
	}

	@Override
	public String toString() {
		return "Category [Id=" + Id + ", CategoryType=" + CategoryType + ", TransactionType=" + TransactionType
				+ ", PurchaseDate=" + PurchaseDate + ", Amount=" + Amount + "]";
	}
}
