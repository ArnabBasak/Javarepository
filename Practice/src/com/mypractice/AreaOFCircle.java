package com.mypractice;

import java.util.Scanner;

public class AreaOFCircle {
	public double radius;
	public double pi = 3.14;
	Scanner inputsteam = new Scanner(System.in);
	public void inputdata()
	{
		System.out.println("enter the radius");
		radius = inputsteam.nextDouble();
		
	}
	public void calculateCircleArea()
	{
		double circleArea = 3.14*(radius*radius);
		System.out.println("area of circle"+circleArea);
	}

}
