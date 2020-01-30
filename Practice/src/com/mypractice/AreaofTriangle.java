package com.mypractice;

import java.util.Scanner;

public class AreaofTriangle {
	public double length;
	public double breadth;
	public double area;
	public double height;
	public void inputdata()
	{
		Scanner input = new Scanner(System.in);
		System.out.println("enter the length");
		length = input.nextDouble();
		System.out.println("enter the breadth");
		breadth = input.nextDouble();
		System.out.println("enter the height");
		breadth = input.nextDouble();
	}
	public void calculateAreaOfTriangle()
	{
		area = length * breadth * height;
		System.out.println("area of triagnle is"+area);
	}

}
