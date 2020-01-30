package com.mypractice;

import java.util.Scanner;

public class SimpleInterest {
	public double p = 0;
	public double n = 0;
	public double r = 0;
	public double sp = 0;
	public void inputdata()
	{
		Scanner in = new Scanner(System.in);
		System.out.println("enter the value of priciple");
		p = in.nextDouble();
		System.out.println("enter the value of number of years");
		n = in.nextDouble();
		System.out.println("enter the rate of interests");
		r = in.nextDouble();
		
	}
	public void calculateInterests()
	{
		sp = (p*n*r)/100;
		System.out.println("simple interest : "+sp);
	}

}
