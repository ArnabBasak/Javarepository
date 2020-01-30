package com.constructor;

public class MethodOverloading {
	
	public void add(int a,int b)
	{
		System.out.println("public int add(int a,int b) method got invoked");
		int c = a + b;
		System.out.println(c);
		
	}
	public void add(int a,int b,int c)
	{
		System.out.println("public int add(int a,int b,int c) method got invoked");
		int d = a + b + c;
		System.out.println(d);
	}
	

}
