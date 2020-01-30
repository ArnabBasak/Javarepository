package com.mypractice;

import java.util.Scanner;

public class Substraction {
	public int num1;
	public int num2;
	public int num3 = 0;
	
	public void inputdata()
	{
		System.out.println("Add the numbers to be added");
		Scanner inputstream = new Scanner(System.in);
		System.out.println("enter 1st number");
		num1 = inputstream.nextInt();
		System.out.println("enter 2nd number");
		num2 = inputstream.nextInt();
			
	}
	public void calculateSub()
	{
		num3 = num1 - num2;
		System.out.println("Substraction of the inputed numbers are: "+num3);
	}

}
