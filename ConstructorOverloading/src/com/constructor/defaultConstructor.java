package com.constructor;

public class defaultConstructor {
	
	public defaultConstructor()
	{
		System.out.println("public defaultConstructor()");
		System.out.println();
		System.out.println("This is the default constructor which got invoked");
		System.out.println();
	}
	
	public defaultConstructor(String name)
	{
		System.out.println();
		System.out.println("public defaultConstructor(String name)");
		System.out.println();
		System.out.println("This is a parameterized constructor which got invoked");
		System.out.println();
		System.out.println("Hello "+name);
		System.out.println();
	}
	
	public defaultConstructor(String firstname, String lastname)
	{
		
		System.out.println();
		System.out.println("public defaultConstructor(String firstname, String lastname)");
		System.out.println();
		System.out.println("This is constructor overloading");
		System.out.println();
		System.out.println("Hello "+firstname+" "+lastname);
	}
	

}
