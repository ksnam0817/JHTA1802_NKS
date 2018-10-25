package bean;

public class TotVo {
	int    ea;
	double price;
	double tax;
	double amount;
	double tot;
	
	public TotVo(int ea, double price) {
		this.ea = ea;
		this.price = price;
		amount = ea*price;
		tax = amount*0.1;
		tot = amount + tax; 
	}
	
	public double getTot() {
		return tot;
	}
	public void setTot(double tot) {
		this.tot = tot;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	
}
