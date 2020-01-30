package com.constructor;

import java.util.Scanner;

public class MainConstructorClass {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("enter your choice");
		int choice = in.nextInt();
		if (choice == 1)
		{
			defaultConstructor fc = new defaultConstructor();
		}
		else if(choice == 2)
		{
			defaultConstructor fc1 = new defaultConstructor("Arnab");
		}
		else if(choice == 3)
		{
			defaultConstructor fc2 = new defaultConstructor("Arnab","Basak");
		}
		else if(choice == 0)
		{
			defaultConstructor fc = new defaultConstructor();
			defaultConstructor fc1 = new defaultConstructor("Arnab");
			defaultConstructor fc2 = new defaultConstructor("Arnab","Basak");
		}
		else if(choice == 4)
		{
			MethodOverloading mo = new MethodOverloading();
			mo.add(10, 20);
			mo.add(12, 13, 14);
		}
		else if(choice == 5)
		{
			ThisKeyword tk = new ThisKeyword();
			tk.calc(12, 12);
		}
		else
		{
			System.out.println("invalid option");
		}
		

	}

}
