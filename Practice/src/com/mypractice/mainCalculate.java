package com.mypractice;

import java.util.Scanner;

public class mainCalculate {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner inputstream = new Scanner(System.in);
		System.out.println(".....WELCOME TO MY CALCULATOR.....");
		System.out.println("Enter your choice from below options");
		System.out.println("1.Addition");
		System.out.println("2.Substraction");
		System.out.println("3.Multiplication");
		System.out.println("4.division");
		System.out.println("5.Area of circle");
		System.out.println("6.Area of triangle");
		System.out.println("7.Simple interest");
		int option = inputstream.nextInt();
		switch (option)
		{
		case 1:
			Addition add = new Addition();
			add.inputdata();
			add.calculateAdd();
			break;
		case 2:
			Substraction sub = new Substraction();
			sub.inputdata();
			sub.calculateSub();
			break;
		case 3:
			Multiplication mul = new Multiplication();
			mul.inputdata();
			mul.calculateMultiply();
			break;
		case 4:
			Division div = new Division();
			div.inputdata();
			div.calculatediv();
			break;
		case 5:
			AreaOFCircle area = new AreaOFCircle();
			area.inputdata();
			area.calculateCircleArea();
			break;
		case 6:
			AreaofTriangle areat = new AreaofTriangle();
			areat.inputdata();
			areat.calculateAreaOfTriangle();
			break;
		case 7:
			SimpleInterest si = new SimpleInterest();
			si.inputdata();
			si.calculateInterests();
			break;
		default:
			System.out.println("invalid option");
			break;			
		}
		}
		

	}

