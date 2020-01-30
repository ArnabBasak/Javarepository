package com.constructor;

import java.util.Scanner;

public class ThisKeyword {
	int num1,num2,num3;
	
	public void calc(int num1,int num2)
	{
		this.num1 = 20;
		this.num2  = 40;
		System.out.println("value of num1 and num2 "+ num1+num2);
		System.out.println("current value of This.num1 and This.num2 is: "+this.num1+" and "+this.num2);
		//Scanner in = new Scanner(System.in);
		//num1 = in.nextInt();
		//num2 = in.nextInt();
		this.num1 = num1;
		this.num2 = num2;
		System.out.println("After assignment keyword value of num1 num2 is"+this.num1+" and "+this.num2);
		
	}
	

}
